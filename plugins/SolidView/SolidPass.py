# Copyright (c) 2015 Ultimaker B.V.
# Cura is released under the terms of the AGPLv3 or higher.

import os.path

from UM.Application import Application
from UM.PluginRegistry import PluginRegistry

from UM.View.RenderPass import RenderPass
from UM.View.RenderBatch import RenderBatch
from UM.View.GL.OpenGL import OpenGL

from UM.Scene.SceneNode import SceneNode
from UM.Scene.Iterator.DepthFirstIterator import DepthFirstIterator

class SolidPass(RenderPass):
    def __init__(self, width, height):
        super().__init__("solid", width, height)

        self._gl = OpenGL.getInstance();
        self._shader = None
        self._gl = OpenGL.getInstance().getBindingsObject()
        self._scene = Application.getInstance().getController().getScene()

    def render(self):
        if not self._shader:
            self._shader = OpenGL.getInstance().createShaderProgram(os.path.join(PluginRegistry.getInstance().getPluginPath("SolidView"), "overhang.shader"))

        #batch = RenderBatch(self._shader, type = RenderBatch.RenderType.NoType, backface_cull = False, blend_mode = RenderBatch.BlendMode.Additive)
        #for node in DepthFirstIterator(self._scene.getRoot()):
        #    if type(node) is SceneNode and node.getMeshData() and node.isVisible():
        #        batch.addItem(node.getWorldTransformation(), node.getMeshData())

        self.bind()

        self._gl.glDisable(self._gl.GL_DEPTH_TEST)
        batch.render(self._scene.getActiveCamera())
        self._gl.glEnable(self._gl.GL_DEPTH_TEST)

        self.release()
