#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
This experiment was created using PsychoPy3 Experiment Builder (v2022.1.4),
    on November 07, 2022, at 20:09
If you publish work using this script the most relevant publication is:

    Peirce J, Gray JR, Simpson S, MacAskill M, Höchenberger R, Sogo H, Kastman E, Lindeløv JK. (2019) 
        PsychoPy2: Experiments in behavior made easy Behav Res 51: 195. 
        https://doi.org/10.3758/s13428-018-01193-y

"""

from psychopy import locale_setup
from psychopy import prefs
from psychopy import sound, gui, visual, core, data, event, logging, clock, colors, layout
from psychopy.constants import (NOT_STARTED, STARTED, PLAYING, PAUSED,
                                STOPPED, FINISHED, PRESSED, RELEASED, FOREVER)

import numpy as np  # whole numpy lib is available, prepend 'np.'
from numpy import (sin, cos, tan, log, log10, pi, average,
                   sqrt, std, deg2rad, rad2deg, linspace, asarray)
from numpy.random import random, randint, normal, shuffle, choice as randchoice
import os  # handy system and path functions
import sys  # to get file system encoding

import psychopy.iohub as io
from psychopy.hardware import keyboard



# Ensure that relative paths start from the same directory as this script
_thisDir = os.path.dirname(os.path.abspath(__file__))
os.chdir(_thisDir)
# Store info about the experiment session
psychopyVersion = '2022.1.4'
expName = 'HMT'  # from the Builder filename that created this script
expInfo = {
    'participant': '',
    'session': '001',
}
dlg = gui.DlgFromDict(dictionary=expInfo, sortKeys=False, title=expName)
if dlg.OK == False:
    core.quit()  # user pressed cancel
expInfo['date'] = data.getDateStr()  # add a simple timestamp
expInfo['expName'] = expName
expInfo['psychopyVersion'] = psychopyVersion

# Data file name stem = absolute path + name; later add .psyexp, .csv, .log, etc
filename = _thisDir + os.sep + u'data/%s_%s_%s' % (expInfo['participant'], expName, expInfo['date'])

# An ExperimentHandler isn't essential but helps with data saving
thisExp = data.ExperimentHandler(name=expName, version='',
    extraInfo=expInfo, runtimeInfo=None,
    originPath='C:\\Users\\Jan\\OneDrive - bwstaff\\Desktop\\neurocognitive-psychometrics\\Study 2\\Tasks\\3 HMT_v2\\HMT_lastrun.py',
    savePickle=True, saveWideText=True,
    dataFileName=filename)
# save a log file for detail verbose info
logFile = logging.LogFile(filename+'.log', level=logging.EXP)
logging.console.setLevel(logging.WARNING)  # this outputs to the screen, not a file

endExpNow = False  # flag for 'escape' or other condition => quit the exp
frameTolerance = 0.001  # how close to onset before 'same' frame

# Start Code - component code to be run after the window creation

# Setup the Window
win = visual.Window(
    size=[1280, 1024], fullscr=True, screen=0, 
    winType='pyglet', allowGUI=False, allowStencil=False,
    monitor='testMonitor', color=[1,1,1], colorSpace='rgb',
    blendMode='avg', useFBO=True, 
    units='pix')
# store frame rate of monitor if we can measure it
expInfo['frameRate'] = win.getActualFrameRate()
if expInfo['frameRate'] != None:
    frameDur = 1.0 / round(expInfo['frameRate'])
else:
    frameDur = 1.0 / 60.0  # could not measure, so guess
# Setup ioHub
ioConfig = {}

# Setup iohub keyboard
ioConfig['Keyboard'] = dict(use_keymap='psychopy')

ioSession = '1'
if 'session' in expInfo:
    ioSession = str(expInfo['session'])
ioServer = io.launchHubServer(window=win, **ioConfig)
eyetracker = None

# create a default keyboard (e.g. to check for escape)
defaultKeyboard = keyboard.Keyboard(backend='iohub')

# Initialize components for Routine "Instruction1"
Instruction1Clock = core.Clock()
Probe_2 = visual.ImageStim(
    win=win,
    name='Probe_2', 
    image='graphics/HMT(-S) Examples/HMTe_1.png', mask=None, anchor='center',
    ori=0, pos=(0, -150), size=(200,200),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=0.0)
Prac1 = event.Mouse(win=win)
x, y = [None, None]
Prac1.mouseClock = core.Clock()
Mat1_2 = visual.ImageStim(
    win=win,
    name='Mat1_2', 
    image='graphics/HMT(-S) Examples/HMTe_1_Sol_1.png', mask=None, anchor='center',
    ori=0, pos=(-525, -350), size=(75, 75),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-2.0)
Mat2_2 = visual.ImageStim(
    win=win,
    name='Mat2_2', 
    image='graphics/HMT(-S) Examples/HMTe_1_Sol_2.png', mask=None, anchor='center',
    ori=0, pos=(-375, -350), size=(75, 75),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-3.0)
Mat3_2 = visual.ImageStim(
    win=win,
    name='Mat3_2', 
    image='graphics/HMT(-S) Examples/HMTe_1_Sol_3.png', mask=None, anchor='center',
    ori=0, pos=(-225, -350), size=(75,75),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-4.0)
Mat4_2 = visual.ImageStim(
    win=win,
    name='Mat4_2', 
    image='graphics/HMT(-S) Examples/HMTe_1_Sol_4.png', mask=None, anchor='center',
    ori=0, pos=(-75, -350), size=(75, 75),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-5.0)
Mat5_2 = visual.ImageStim(
    win=win,
    name='Mat5_2', 
    image='graphics/HMT(-S) Examples/HMTe_1_Sol_5.png', mask=None, anchor='center',
    ori=0, pos=(75, -350), size=(75, 75),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-6.0)
Mat6_2 = visual.ImageStim(
    win=win,
    name='Mat6_2', 
    image='graphics/HMT(-S) Examples/HMTe_1_Sol_6.png', mask=None, anchor='center',
    ori=0, pos=(225, -350), size=(75,75),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-7.0)
Mat7_2 = visual.ImageStim(
    win=win,
    name='Mat7_2', 
    image='graphics/HMT(-S) Examples/HMTe_1_Sol_7.png', mask=None, anchor='center',
    ori=0, pos=(375, -350), size=(75,75),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-8.0)
Mat8_2 = visual.ImageStim(
    win=win,
    name='Mat8_2', 
    image='graphics/HMT(-S) Examples/HMTe_1_Sol_8.png', mask=None, anchor='center',
    ori=0, pos=(525, -350), size=(75,75),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-9.0)
Resp1_2 = visual.Rect(
    win=win, name='Resp1_2',
    width=(80, 80)[0], height=(80, 80)[1],
    ori=0, pos=(-525, -350), anchor='center',
    lineWidth=2,     colorSpace='rgb',  lineColor='grey', fillColor=None,
    opacity=1, depth=-10.0, interpolate=True)
Resp2_2 = visual.Rect(
    win=win, name='Resp2_2',
    width=(80, 80)[0], height=(80, 80)[1],
    ori=0, pos=(-375, -350), anchor='center',
    lineWidth=2,     colorSpace='rgb',  lineColor='grey', fillColor=None,
    opacity=1, depth=-11.0, interpolate=True)
Resp3_2 = visual.Rect(
    win=win, name='Resp3_2',
    width=(80, 80)[0], height=(80, 80)[1],
    ori=0, pos=(-225, -350), anchor='center',
    lineWidth=2,     colorSpace='rgb',  lineColor='grey', fillColor=None,
    opacity=1, depth=-12.0, interpolate=True)
Resp4_2 = visual.Rect(
    win=win, name='Resp4_2',
    width=(80, 80)[0], height=(80, 80)[1],
    ori=0, pos=(-75, -350), anchor='center',
    lineWidth=2,     colorSpace='rgb',  lineColor='grey', fillColor=None,
    opacity=1, depth=-13.0, interpolate=True)
Resp5_2 = visual.Rect(
    win=win, name='Resp5_2',
    width=(80, 80)[0], height=(80, 80)[1],
    ori=0, pos=(75, -350), anchor='center',
    lineWidth=2,     colorSpace='rgb',  lineColor='grey', fillColor=None,
    opacity=1, depth=-14.0, interpolate=True)
Resp6_2 = visual.Rect(
    win=win, name='Resp6_2',
    width=(80, 80)[0], height=(80, 80)[1],
    ori=0, pos=(225, -350), anchor='center',
    lineWidth=2,     colorSpace='rgb',  lineColor='grey', fillColor=None,
    opacity=1, depth=-15.0, interpolate=True)
Resp7_2 = visual.Rect(
    win=win, name='Resp7_2',
    width=(80, 80)[0], height=(80, 80)[1],
    ori=0, pos=(375, -350), anchor='center',
    lineWidth=2,     colorSpace='rgb',  lineColor='grey', fillColor=None,
    opacity=1, depth=-16.0, interpolate=True)
Resp8_2 = visual.Rect(
    win=win, name='Resp8_2',
    width=(80, 80)[0], height=(80, 80)[1],
    ori=0, pos=(525, -350), anchor='center',
    lineWidth=2,     colorSpace='rgb',  lineColor='grey', fillColor=None,
    opacity=1, depth=-17.0, interpolate=True)
mouse_final_2 = event.Mouse(win=win)
x, y = [None, None]
mouse_final_2.mouseClock = core.Clock()
Text = visual.TextStim(win=win, name='Text',
    text='Liebe/r Teilnehmer/in, \n\nbei dem folgenden Test geht es darum, Regeln in abstrakten Mustern zu erkennen und sie logisch richtig fortzusetzen. Bei jeder Aufgabe ist ein unvollständiges Puzzle zu sehen. Die dargestellten Muster folgen dabei Regeln, die per Spalte, per Zeile und in der Diagonale gelten können. Sie können sich auf die ganze Figur oder nur auf Teile beziehen. Sie können Hinzufügungen (Addition) oder Wegnahmen (Subtraktion) sowie die Ausrichtung von Figuren oder Einzelkomponenten zum Inhalt haben. Wichtig ist, verschiedene Regeln gleichzeitig zu berücksichtigen. Neu eins der acht Teile ergänzt die auf dem Puzzle abgebildete Figurenfolge richtig. \n\nIhre Aufgabe besteht darin, das Puzzlestück auszuwählen, das die Figur richtig ergänzt.\nFür die Bearbeitung der Aufgaben haben Sie jeweils 2:00 Minuten Zeit.\n\nBeispiel 1: \nWelches Puzzlestück ergänzt die dargestellte Figurenfolge richtig?\n(Bitte anklicken und anschließend auf "Weiter" klicken.)',
    font='Arial',
    pos=(0, 200), height=20, wrapWidth=1200, ori=0, 
    color='black', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-21.0);
Next_2 = visual.ImageStim(
    win=win,
    name='Next_2', 
    image='Image/Weiter.png', mask=None, anchor='center',
    ori=0, pos=(550, -450), size=(90, 50),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-23.0)
Logo = visual.ImageStim(
    win=win,
    name='Logo', 
    image='image/logo.png', mask=None, anchor='center',
    ori=0, pos=(500, 450), size=(100, 100),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-24.0)

# Initialize components for Routine "Instruction2"
Instruction2Clock = core.Clock()
Instruction1_2 = visual.TextStim(win=win, name='Instruction1_2',
    text='Beispiel 1\n\nLösung:\n\nDas 1. Puzzlestück ist die einzige richtige Lösung. \n\nBei dieser Aufgabe besteht die eine Regel darin, dass die gestrichelten Linien in der Diagonalen immer ein X abbilden, in den anderen Feldern ein Kreuz. Aslo muss das fehlende Stück ein gestricheltes X haben. Die andere Regel besteht darin, dass die Lage des schwarzen Vierecks systematisch variiert wird: Pro Zelle und pro Spalte "wandert" das schwarze Viereck im Uhrzeigersinn. Deshalb muss es bei dem ergänzenden Stück unten in der Mitte sein. \n\nBitte klicken Sie auf "Weiter", um zur nächsten Beispielaufgabe zu gelangen.',
    font='Arial',
    pos=(0, 200), height=20, wrapWidth=1200, ori=0, 
    color='black', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=0.0);
mouse_Prac_1_sol = event.Mouse(win=win)
x, y = [None, None]
mouse_Prac_1_sol.mouseClock = core.Clock()
Prac_1 = visual.ImageStim(
    win=win,
    name='Prac_1', 
    image='graphics/HMT(-S) Examples/HMTe_1_Sol_1.png', mask=None, anchor='center',
    ori=0, pos=(-525, -350), size=(75, 75),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-3.0)
Prac_1_9 = visual.ImageStim(
    win=win,
    name='Prac_1_9', 
    image='graphics/HMT(-S) Examples/HMTe_1_Sol_2.png', mask=None, anchor='center',
    ori=0, pos=(-375, -350), size=(75, 75),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-4.0)
Prac_1_10 = visual.ImageStim(
    win=win,
    name='Prac_1_10', 
    image='graphics/HMT(-S) Examples/HMTe_1_Sol_3.png', mask=None, anchor='center',
    ori=0, pos=(-225, -350), size=(75, 75),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-5.0)
Prac_1_11 = visual.ImageStim(
    win=win,
    name='Prac_1_11', 
    image='graphics/HMT(-S) Examples/HMTe_1_Sol_4.png', mask=None, anchor='center',
    ori=0, pos=(-75, -350), size=(75, 75),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-6.0)
Prac_1_12 = visual.ImageStim(
    win=win,
    name='Prac_1_12', 
    image='graphics/HMT(-S) Examples/HMTe_1_Sol_5.png', mask=None, anchor='center',
    ori=0, pos=(75, -350), size=(75, 75),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-7.0)
Prac_1_13 = visual.ImageStim(
    win=win,
    name='Prac_1_13', 
    image='graphics/HMT(-S) Examples/HMTe_1_Sol_6.png', mask=None, anchor='center',
    ori=0, pos=(225, -350), size=(75, 75),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-8.0)
Prac_1_14 = visual.ImageStim(
    win=win,
    name='Prac_1_14', 
    image='graphics/HMT(-S) Examples/HMTe_1_Sol_7.png', mask=None, anchor='center',
    ori=0, pos=(375, -350), size=(75, 75),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-9.0)
Prac_1_15 = visual.ImageStim(
    win=win,
    name='Prac_1_15', 
    image='graphics/HMT(-S) Examples/HMTe_1_Sol_8.png', mask=None, anchor='center',
    ori=0, pos=(525, -350), size=(75, 75),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-10.0)
Prac1_2 = visual.ImageStim(
    win=win,
    name='Prac1_2', 
    image='graphics/HMT(-S) Examples/HMTe_1.png', mask=None, anchor='center',
    ori=0, pos=(0, -150), size=(200, 200),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-11.0)
Prac_1_Resp1_2 = visual.Rect(
    win=win, name='Prac_1_Resp1_2',
    width=(80, 80)[0], height=(80, 80)[1],
    ori=0, pos=(-525, -350), anchor='center',
    lineWidth=2,     colorSpace='rgb',  lineColor='green', fillColor=None,
    opacity=1, depth=-12.0, interpolate=True)
Logo_2 = visual.ImageStim(
    win=win,
    name='Logo_2', 
    image='image/logo.png', mask=None, anchor='center',
    ori=0, pos=(500, 450), size=(100, 100),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-13.0)
Next_Inst_sol = visual.ImageStim(
    win=win,
    name='Next_Inst_sol', 
    image='image/Weiter.png', mask=None, anchor='center',
    ori=0, pos=(550, -450), size=(90, 50),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-14.0)

# Initialize components for Routine "ITI"
ITIClock = core.Clock()
White = visual.ShapeStim(
    win=win, name='White',
    size=(0.5, 0.5), vertices='triangle',
    ori=0, pos=(0, 0), anchor='center',
    lineWidth=1,     colorSpace='rgb',  lineColor='white', fillColor='white',
    opacity=1, depth=0.0, interpolate=True)

# Initialize components for Routine "Instruction3_2"
Instruction3_2Clock = core.Clock()
Probe_3 = visual.ImageStim(
    win=win,
    name='Probe_3', 
    image='graphics/HMT(-S) Examples/HMTe_2.png', mask=None, anchor='center',
    ori=0, pos=(0, -150), size=(200,200),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=0.0)
Prac1_3 = event.Mouse(win=win)
x, y = [None, None]
Prac1_3.mouseClock = core.Clock()
Mat1_3 = visual.ImageStim(
    win=win,
    name='Mat1_3', 
    image='graphics/HMT(-S) Examples/HMTe_2_Sol_1.png', mask=None, anchor='center',
    ori=0, pos=(-525, -350), size=(75, 75),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-2.0)
Mat2_3 = visual.ImageStim(
    win=win,
    name='Mat2_3', 
    image='graphics/HMT(-S) Examples/HMTe_2_Sol_2.png', mask=None, anchor='center',
    ori=0, pos=(-375, -350), size=(75, 75),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-3.0)
Mat3_3 = visual.ImageStim(
    win=win,
    name='Mat3_3', 
    image='graphics/HMT(-S) Examples/HMTe_2_Sol_3.png', mask=None, anchor='center',
    ori=0, pos=(-225, -350), size=(75,75),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-4.0)
Mat4_3 = visual.ImageStim(
    win=win,
    name='Mat4_3', 
    image='graphics/HMT(-S) Examples/HMTe_2_Sol_4.png', mask=None, anchor='center',
    ori=0, pos=(-75, -350), size=(75, 75),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-5.0)
Mat5_3 = visual.ImageStim(
    win=win,
    name='Mat5_3', 
    image='graphics/HMT(-S) Examples/HMTe_2_Sol_5.png', mask=None, anchor='center',
    ori=0, pos=(75, -350), size=(75, 75),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-6.0)
Mat6_3 = visual.ImageStim(
    win=win,
    name='Mat6_3', 
    image='graphics/HMT(-S) Examples/HMTe_2_Sol_6.png', mask=None, anchor='center',
    ori=0, pos=(225, -350), size=(75,75),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-7.0)
Mat7_3 = visual.ImageStim(
    win=win,
    name='Mat7_3', 
    image='graphics/HMT(-S) Examples/HMTe_2_Sol_7.png', mask=None, anchor='center',
    ori=0, pos=(375, -350), size=(75,75),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-8.0)
Mat8_3 = visual.ImageStim(
    win=win,
    name='Mat8_3', 
    image='graphics/HMT(-S) Examples/HMTe_2_Sol_8.png', mask=None, anchor='center',
    ori=0, pos=(525, -350), size=(75,75),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-9.0)
Resp1_3 = visual.Rect(
    win=win, name='Resp1_3',
    width=(80, 80)[0], height=(80, 80)[1],
    ori=0, pos=(-525, -350), anchor='center',
    lineWidth=2,     colorSpace='rgb',  lineColor='grey', fillColor=None,
    opacity=1, depth=-10.0, interpolate=True)
Resp2_3 = visual.Rect(
    win=win, name='Resp2_3',
    width=(80, 80)[0], height=(80, 80)[1],
    ori=0, pos=(-375, -350), anchor='center',
    lineWidth=2,     colorSpace='rgb',  lineColor='grey', fillColor=None,
    opacity=1, depth=-11.0, interpolate=True)
Resp3_3 = visual.Rect(
    win=win, name='Resp3_3',
    width=(80, 80)[0], height=(80, 80)[1],
    ori=0, pos=(-225, -350), anchor='center',
    lineWidth=2,     colorSpace='rgb',  lineColor='grey', fillColor=None,
    opacity=1, depth=-12.0, interpolate=True)
Resp4_3 = visual.Rect(
    win=win, name='Resp4_3',
    width=(80, 80)[0], height=(80, 80)[1],
    ori=0, pos=(-75, -350), anchor='center',
    lineWidth=2,     colorSpace='rgb',  lineColor='grey', fillColor=None,
    opacity=1, depth=-13.0, interpolate=True)
Resp5_3 = visual.Rect(
    win=win, name='Resp5_3',
    width=(80, 80)[0], height=(80, 80)[1],
    ori=0, pos=(75, -350), anchor='center',
    lineWidth=2,     colorSpace='rgb',  lineColor='grey', fillColor=None,
    opacity=1, depth=-14.0, interpolate=True)
Resp6_3 = visual.Rect(
    win=win, name='Resp6_3',
    width=(80, 80)[0], height=(80, 80)[1],
    ori=0, pos=(225, -350), anchor='center',
    lineWidth=2,     colorSpace='rgb',  lineColor='grey', fillColor=None,
    opacity=1, depth=-15.0, interpolate=True)
Resp7_3 = visual.Rect(
    win=win, name='Resp7_3',
    width=(80, 80)[0], height=(80, 80)[1],
    ori=0, pos=(375, -350), anchor='center',
    lineWidth=2,     colorSpace='rgb',  lineColor='grey', fillColor=None,
    opacity=1, depth=-16.0, interpolate=True)
Resp8_3 = visual.Rect(
    win=win, name='Resp8_3',
    width=(80, 80)[0], height=(80, 80)[1],
    ori=0, pos=(525, -350), anchor='center',
    lineWidth=2,     colorSpace='rgb',  lineColor='grey', fillColor=None,
    opacity=1, depth=-17.0, interpolate=True)
mouse_final_3 = event.Mouse(win=win)
x, y = [None, None]
mouse_final_3.mouseClock = core.Clock()
Text_2 = visual.TextStim(win=win, name='Text_2',
    text='Beispiel 2\n\nWelches Puzzlestück ergänzt die dargestellte Figurenfolge richtig?\n(Bitte anklicken und anschließend auf "Weiter" klicken.)',
    font='Arial',
    pos=(0, 200), height=20, wrapWidth=1200, ori=0, 
    color='black', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-21.0);
Next_3 = visual.ImageStim(
    win=win,
    name='Next_3', 
    image='Image/Weiter.png', mask=None, anchor='center',
    ori=0, pos=(550, -450), size=(90, 50),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-23.0)
Logo_7 = visual.ImageStim(
    win=win,
    name='Logo_7', 
    image='image/logo.png', mask=None, anchor='center',
    ori=0, pos=(500, 450), size=(100, 100),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-24.0)

# Initialize components for Routine "Instruction4"
Instruction4Clock = core.Clock()
mouse_Inst2_2 = event.Mouse(win=win)
x, y = [None, None]
mouse_Inst2_2.mouseClock = core.Clock()
Prac1_4 = visual.ImageStim(
    win=win,
    name='Prac1_4', 
    image='graphics/HMT(-S) Examples/HMTe_2.png', mask=None, anchor='center',
    ori=0, pos=(0, -150), size=(200, 200),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-1.0)
Instruction1_4 = visual.TextStim(win=win, name='Instruction1_4',
    text='Beispiel 2\n\nLösung:\n\nDas 6. Puzzlestück ist die einzige richtige Lösung. \n\nBei dieser Aufgabe muss man in jeder zeile eine Subtraktion durchführen. Die Elemente, die an zweiter Stelle stehen, werden jeweils von den Elementen der ersten Spalte abgezogen. In der Dritten Spalte müssen somit die Elemente vorhanden sein, die sich in der ersten Spalte befinden, in der zweiten jedoch nicht. Der quadratische Rahmen ist von der Subtraktion ausgenommen und wird beibehalten.\n\nBitte klicken Sie auf "Weiter", um zur ersten Aufgabe zu gelangen. \n',
    font='Arial',
    pos=(0, 200), height=20, wrapWidth=1200, ori=0, 
    color='black', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-2.0);
Prac_2 = visual.ImageStim(
    win=win,
    name='Prac_2', 
    image='graphics/HMT(-S) Examples/HMTe_2_Sol_1.png', mask=None, anchor='center',
    ori=0, pos=(-525, -350), size=(75, 75),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-4.0)
Prac_2_9 = visual.ImageStim(
    win=win,
    name='Prac_2_9', 
    image='graphics/HMT(-S) Examples/HMTe_2_Sol_2.png', mask=None, anchor='center',
    ori=0, pos=(-375, -350), size=(75, 75),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-5.0)
Prac_2_10 = visual.ImageStim(
    win=win,
    name='Prac_2_10', 
    image='graphics/HMT(-S) Examples/HMTe_2_Sol_3.png', mask=None, anchor='center',
    ori=0, pos=(-225, -350), size=(75, 75),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-6.0)
Prac_2_11 = visual.ImageStim(
    win=win,
    name='Prac_2_11', 
    image='graphics/HMT(-S) Examples/HMTe_2_Sol_4.png', mask=None, anchor='center',
    ori=0, pos=(-75, -350), size=(75, 75),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-7.0)
Prac_2_12 = visual.ImageStim(
    win=win,
    name='Prac_2_12', 
    image='graphics/HMT(-S) Examples/HMTe_2_Sol_5.png', mask=None, anchor='center',
    ori=0, pos=(75, -350), size=(75, 75),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-8.0)
Prac_2_13 = visual.ImageStim(
    win=win,
    name='Prac_2_13', 
    image='graphics/HMT(-S) Examples/HMTe_2_Sol_6.png', mask=None, anchor='center',
    ori=0, pos=(225, -350), size=(75, 75),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-9.0)
Prac_2_14 = visual.ImageStim(
    win=win,
    name='Prac_2_14', 
    image='graphics/HMT(-S) Examples/HMTe_2_Sol_7.png', mask=None, anchor='center',
    ori=0, pos=(375, -350), size=(75, 75),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-10.0)
Prac_2_15 = visual.ImageStim(
    win=win,
    name='Prac_2_15', 
    image='graphics/HMT(-S) Examples/HMTe_2_Sol_8.png', mask=None, anchor='center',
    ori=0, pos=(525, -350), size=(75, 75),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-11.0)
Prac_2_Resp6_2 = visual.Rect(
    win=win, name='Prac_2_Resp6_2',
    width=(80, 80)[0], height=(80, 80)[1],
    ori=0, pos=(225, -350), anchor='center',
    lineWidth=2,     colorSpace='rgb',  lineColor='green', fillColor=None,
    opacity=1, depth=-12.0, interpolate=True)
Logo_4 = visual.ImageStim(
    win=win,
    name='Logo_4', 
    image='image/logo.png', mask=None, anchor='center',
    ori=0, pos=(500, 450), size=(100, 100),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-13.0)
Next_Inst_3 = visual.ImageStim(
    win=win,
    name='Next_Inst_3', 
    image='Image/Weiter.png', mask=None, anchor='center',
    ori=0, pos=(550, -450), size=(90, 50),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-14.0)

# Initialize components for Routine "Start"
StartClock = core.Clock()
Start_text = visual.TextStim(win=win, name='Start_text',
    text='Es folgen nun 20 Aufgaben. \n\nMarkieren Sie die nach Ihrer Meinung richtige Lösung und klicken Sie auf den "Weiter“. Für jede Aufgabe haben Sie 2:00 Minuten Zeit zur Beantwortung. Nach dieser Zeit wird automatisch die nächste Aufgabe gezeigt. \n\nViel Erfolg!\n',
    font='Arial',
    pos=(-50, 200), height=20, wrapWidth=1000, ori=0, 
    color='black', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=0.0);
Start_text.alignText = 'left'
mouse_start = event.Mouse(win=win)
x, y = [None, None]
mouse_start.mouseClock = core.Clock()
Start_Button = visual.ImageStim(
    win=win,
    name='Start_Button', 
    image='image/Weiter.png', mask=None, anchor='center',
    ori=0, pos=(550, -450), size=[90,50],
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=512, interpolate=True, depth=-3.0)
Logo_5 = visual.ImageStim(
    win=win,
    name='Logo_5', 
    image='image/logo.png', mask=None, anchor='center',
    ori=0, pos=(500, 450), size=(100, 100),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-4.0)

# Initialize components for Routine "ITI"
ITIClock = core.Clock()
White = visual.ShapeStim(
    win=win, name='White',
    size=(0.5, 0.5), vertices='triangle',
    ori=0, pos=(0, 0), anchor='center',
    lineWidth=1,     colorSpace='rgb',  lineColor='white', fillColor='white',
    opacity=1, depth=0.0, interpolate=True)

# Initialize components for Routine "trial"
trialClock = core.Clock()
text_time = visual.TextStim(win=win, name='text_time',
    text='Ihre Zeit für diese Aufgabe ist abgelaufen! Klicken Sie weiter um fortzufahren ! ',
    font='Arial',
    pos=(0, 0), height=30.0, wrapWidth=None, ori=0.0, 
    color=[-0.5294, 0.4039, -0.1137], colorSpace='rgb', opacity=None, 
    languageStyle='LTR',
    depth=0.0);
Probe = visual.ImageStim(
    win=win,
    name='Probe', 
    image='sin', mask=None, anchor='center',
    ori=0, pos=(0, 200), size=(300,300),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-1.0)
mouse_exp = event.Mouse(win=win)
x, y = [None, None]
mouse_exp.mouseClock = core.Clock()
Mat1 = visual.ImageStim(
    win=win,
    name='Mat1', 
    image='sin', mask=None, anchor='center',
    ori=0, pos=(-525, -150), size=(100, 100),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-3.0)
Mat2 = visual.ImageStim(
    win=win,
    name='Mat2', 
    image='sin', mask=None, anchor='center',
    ori=0, pos=(-375, -150), size=(100, 100),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-4.0)
Mat3 = visual.ImageStim(
    win=win,
    name='Mat3', 
    image='sin', mask=None, anchor='center',
    ori=0, pos=(-225, -150), size=(100, 100),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-5.0)
Mat4 = visual.ImageStim(
    win=win,
    name='Mat4', 
    image='sin', mask=None, anchor='center',
    ori=0, pos=(-75, -150), size=(100, 100),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-6.0)
Mat5 = visual.ImageStim(
    win=win,
    name='Mat5', 
    image='sin', mask=None, anchor='center',
    ori=0, pos=(75, -150), size=(100, 100),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-7.0)
Mat6 = visual.ImageStim(
    win=win,
    name='Mat6', 
    image='sin', mask=None, anchor='center',
    ori=0, pos=(225, -150), size=(100,100),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-8.0)
Mat7 = visual.ImageStim(
    win=win,
    name='Mat7', 
    image='sin', mask=None, anchor='center',
    ori=0, pos=(375, -150), size=(100, 100),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-9.0)
Mat8 = visual.ImageStim(
    win=win,
    name='Mat8', 
    image='sin', mask=None, anchor='center',
    ori=0, pos=(525, -150), size=(100,100),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-10.0)
Resp1 = visual.Rect(
    win=win, name='Resp1',
    width=(110, 110)[0], height=(110, 110)[1],
    ori=0, pos=(-525, -150), anchor='center',
    lineWidth=2,     colorSpace='rgb',  lineColor='grey', fillColor=None,
    opacity=1, depth=-11.0, interpolate=True)
Resp2 = visual.Rect(
    win=win, name='Resp2',
    width=(110, 110)[0], height=(110, 110)[1],
    ori=0, pos=(-375, -150), anchor='center',
    lineWidth=2,     colorSpace='rgb',  lineColor='grey', fillColor=None,
    opacity=1, depth=-12.0, interpolate=True)
Resp3 = visual.Rect(
    win=win, name='Resp3',
    width=(110, 110)[0], height=(110, 110)[1],
    ori=0, pos=(-225, -150), anchor='center',
    lineWidth=2,     colorSpace='rgb',  lineColor='grey', fillColor=None,
    opacity=1, depth=-13.0, interpolate=True)
Resp4 = visual.Rect(
    win=win, name='Resp4',
    width=(110, 110)[0], height=(110, 110)[1],
    ori=0, pos=(-75, -150), anchor='center',
    lineWidth=2,     colorSpace='rgb',  lineColor='grey', fillColor=None,
    opacity=1, depth=-14.0, interpolate=True)
Resp5 = visual.Rect(
    win=win, name='Resp5',
    width=(110, 110)[0], height=(110, 110)[1],
    ori=0, pos=(75, -150), anchor='center',
    lineWidth=2,     colorSpace='rgb',  lineColor='grey', fillColor=None,
    opacity=1, depth=-15.0, interpolate=True)
Resp6 = visual.Rect(
    win=win, name='Resp6',
    width=(110, 110)[0], height=(110, 110)[1],
    ori=0, pos=(225, -150), anchor='center',
    lineWidth=2,     colorSpace='rgb',  lineColor='grey', fillColor=None,
    opacity=1, depth=-16.0, interpolate=True)
Resp7 = visual.Rect(
    win=win, name='Resp7',
    width=(110, 110)[0], height=(110, 110)[1],
    ori=0, pos=(375, -150), anchor='center',
    lineWidth=2,     colorSpace='rgb',  lineColor='grey', fillColor=None,
    opacity=1, depth=-17.0, interpolate=True)
Resp8 = visual.Rect(
    win=win, name='Resp8',
    width=(110, 110)[0], height=(110, 110)[1],
    ori=0, pos=(525, -150), anchor='center',
    lineWidth=2,     colorSpace='rgb',  lineColor='grey', fillColor=None,
    opacity=1, depth=-18.0, interpolate=True)
mouse_final = event.Mouse(win=win)
x, y = [None, None]
mouse_final.mouseClock = core.Clock()
mouse_final_time = event.Mouse(win=win)
x, y = [None, None]
mouse_final_time.mouseClock = core.Clock()
Next = visual.ImageStim(
    win=win,
    name='Next', 
    image='Image/Weiter.png', mask=None, anchor='center',
    ori=0, pos=(550, -450), size=(90, 50),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-25.0)
Times_up = visual.ImageStim(
    win=win,
    name='Times_up', 
    image='Image/Weiter.png', mask=None, anchor='center',
    ori=0, pos=(0, -100), size=(90, 50),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-26.0)
text_time.alignText = 'center'

# Initialize components for Routine "End_Screen"
End_ScreenClock = core.Clock()
End = visual.TextStim(win=win, name='End',
    text='Geschafft!\n\nDiese Teilaufgabe ist nun beendet. \nBitte melden Sie sich bei der Versuchsleitung',
    font='Arial',
    pos=(-50, 0), height=20, wrapWidth=800, ori=0, 
    color='black', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=0.0);
Logo_End = visual.ImageStim(
    win=win,
    name='Logo_End', 
    image='image/logo.png', mask=None, anchor='center',
    ori=0, pos=(500, 450), size=(100, 100),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-1.0)
key_resp = keyboard.Keyboard()

# Create some handy timers
globalClock = core.Clock()  # to track the time since experiment started
routineTimer = core.CountdownTimer()  # to track time remaining of each (non-slip) routine 

# ------Prepare to start Routine "Instruction1"-------
continueRoutine = True
# update component parameters for each repeat
# setup some python lists for storing info about the Prac1
Prac1.x = []
Prac1.y = []
Prac1.leftButton = []
Prac1.midButton = []
Prac1.rightButton = []
Prac1.time = []
Prac1.clicked_name = []
gotValidClick = False  # until a click is received
Prac1.mouseClock.reset()
Resp1_2.opacity=0
Resp2_2.opacity=0
Resp3_2.opacity=0
Resp4_2.opacity=0
Resp5_2.opacity=0
Resp6_2.opacity=0
Resp7_2.opacity=0
Resp8_2.opacity=0
# setup some python lists for storing info about the mouse_final_2
mouse_final_2.clicked_name = []
gotValidClick = False  # until a click is received
Text.alignText = 'left'
# keep track of which components have finished
Instruction1Components = [Probe_2, Prac1, Mat1_2, Mat2_2, Mat3_2, Mat4_2, Mat5_2, Mat6_2, Mat7_2, Mat8_2, Resp1_2, Resp2_2, Resp3_2, Resp4_2, Resp5_2, Resp6_2, Resp7_2, Resp8_2, mouse_final_2, Text, Next_2, Logo]
for thisComponent in Instruction1Components:
    thisComponent.tStart = None
    thisComponent.tStop = None
    thisComponent.tStartRefresh = None
    thisComponent.tStopRefresh = None
    if hasattr(thisComponent, 'status'):
        thisComponent.status = NOT_STARTED
# reset timers
t = 0
_timeToFirstFrame = win.getFutureFlipTime(clock="now")
Instruction1Clock.reset(-_timeToFirstFrame)  # t0 is time of first possible flip
frameN = -1

# -------Run Routine "Instruction1"-------
while continueRoutine:
    # get current time
    t = Instruction1Clock.getTime()
    tThisFlip = win.getFutureFlipTime(clock=Instruction1Clock)
    tThisFlipGlobal = win.getFutureFlipTime(clock=None)
    frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
    # update/draw components on each frame
    
    # *Probe_2* updates
    if Probe_2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Probe_2.frameNStart = frameN  # exact frame index
        Probe_2.tStart = t  # local t and not account for scr refresh
        Probe_2.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Probe_2, 'tStartRefresh')  # time at next scr refresh
        Probe_2.setAutoDraw(True)
    # *Prac1* updates
    if Prac1.status == NOT_STARTED and t >= 0.1-frameTolerance:
        # keep track of start time/frame for later
        Prac1.frameNStart = frameN  # exact frame index
        Prac1.tStart = t  # local t and not account for scr refresh
        Prac1.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Prac1, 'tStartRefresh')  # time at next scr refresh
        Prac1.status = STARTED
        prevButtonState = Prac1.getPressed()  # if button is down already this ISN'T a new click
    if Prac1.status == STARTED:  # only update if started and not finished!
        buttons = Prac1.getPressed()
        if buttons != prevButtonState:  # button state changed?
            prevButtonState = buttons
            if sum(buttons) > 0:  # state changed to a new click
                # check if the mouse was inside our 'clickable' objects
                gotValidClick = False
                try:
                    iter([Mat1_2, Mat2_2, Mat3_2, Mat4_2, Mat5_2, Mat6_2, Mat7_2, Mat8_2])
                    clickableList = [Mat1_2, Mat2_2, Mat3_2, Mat4_2, Mat5_2, Mat6_2, Mat7_2, Mat8_2]
                except:
                    clickableList = [[Mat1_2, Mat2_2, Mat3_2, Mat4_2, Mat5_2, Mat6_2, Mat7_2, Mat8_2]]
                for obj in clickableList:
                    if obj.contains(Prac1):
                        gotValidClick = True
                        Prac1.clicked_name.append(obj.name)
                x, y = Prac1.getPos()
                Prac1.x.append(x)
                Prac1.y.append(y)
                buttons = Prac1.getPressed()
                Prac1.leftButton.append(buttons[0])
                Prac1.midButton.append(buttons[1])
                Prac1.rightButton.append(buttons[2])
                Prac1.time.append(Prac1.mouseClock.getTime())
    
    # *Mat1_2* updates
    if Mat1_2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Mat1_2.frameNStart = frameN  # exact frame index
        Mat1_2.tStart = t  # local t and not account for scr refresh
        Mat1_2.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Mat1_2, 'tStartRefresh')  # time at next scr refresh
        Mat1_2.setAutoDraw(True)
    
    # *Mat2_2* updates
    if Mat2_2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Mat2_2.frameNStart = frameN  # exact frame index
        Mat2_2.tStart = t  # local t and not account for scr refresh
        Mat2_2.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Mat2_2, 'tStartRefresh')  # time at next scr refresh
        Mat2_2.setAutoDraw(True)
    
    # *Mat3_2* updates
    if Mat3_2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Mat3_2.frameNStart = frameN  # exact frame index
        Mat3_2.tStart = t  # local t and not account for scr refresh
        Mat3_2.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Mat3_2, 'tStartRefresh')  # time at next scr refresh
        Mat3_2.setAutoDraw(True)
    
    # *Mat4_2* updates
    if Mat4_2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Mat4_2.frameNStart = frameN  # exact frame index
        Mat4_2.tStart = t  # local t and not account for scr refresh
        Mat4_2.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Mat4_2, 'tStartRefresh')  # time at next scr refresh
        Mat4_2.setAutoDraw(True)
    
    # *Mat5_2* updates
    if Mat5_2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Mat5_2.frameNStart = frameN  # exact frame index
        Mat5_2.tStart = t  # local t and not account for scr refresh
        Mat5_2.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Mat5_2, 'tStartRefresh')  # time at next scr refresh
        Mat5_2.setAutoDraw(True)
    
    # *Mat6_2* updates
    if Mat6_2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Mat6_2.frameNStart = frameN  # exact frame index
        Mat6_2.tStart = t  # local t and not account for scr refresh
        Mat6_2.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Mat6_2, 'tStartRefresh')  # time at next scr refresh
        Mat6_2.setAutoDraw(True)
    
    # *Mat7_2* updates
    if Mat7_2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Mat7_2.frameNStart = frameN  # exact frame index
        Mat7_2.tStart = t  # local t and not account for scr refresh
        Mat7_2.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Mat7_2, 'tStartRefresh')  # time at next scr refresh
        Mat7_2.setAutoDraw(True)
    
    # *Mat8_2* updates
    if Mat8_2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Mat8_2.frameNStart = frameN  # exact frame index
        Mat8_2.tStart = t  # local t and not account for scr refresh
        Mat8_2.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Mat8_2, 'tStartRefresh')  # time at next scr refresh
        Mat8_2.setAutoDraw(True)
    
    # *Resp1_2* updates
    if Resp1_2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Resp1_2.frameNStart = frameN  # exact frame index
        Resp1_2.tStart = t  # local t and not account for scr refresh
        Resp1_2.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Resp1_2, 'tStartRefresh')  # time at next scr refresh
        Resp1_2.setAutoDraw(True)
    
    # *Resp2_2* updates
    if Resp2_2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Resp2_2.frameNStart = frameN  # exact frame index
        Resp2_2.tStart = t  # local t and not account for scr refresh
        Resp2_2.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Resp2_2, 'tStartRefresh')  # time at next scr refresh
        Resp2_2.setAutoDraw(True)
    
    # *Resp3_2* updates
    if Resp3_2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Resp3_2.frameNStart = frameN  # exact frame index
        Resp3_2.tStart = t  # local t and not account for scr refresh
        Resp3_2.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Resp3_2, 'tStartRefresh')  # time at next scr refresh
        Resp3_2.setAutoDraw(True)
    
    # *Resp4_2* updates
    if Resp4_2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Resp4_2.frameNStart = frameN  # exact frame index
        Resp4_2.tStart = t  # local t and not account for scr refresh
        Resp4_2.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Resp4_2, 'tStartRefresh')  # time at next scr refresh
        Resp4_2.setAutoDraw(True)
    
    # *Resp5_2* updates
    if Resp5_2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Resp5_2.frameNStart = frameN  # exact frame index
        Resp5_2.tStart = t  # local t and not account for scr refresh
        Resp5_2.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Resp5_2, 'tStartRefresh')  # time at next scr refresh
        Resp5_2.setAutoDraw(True)
    
    # *Resp6_2* updates
    if Resp6_2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Resp6_2.frameNStart = frameN  # exact frame index
        Resp6_2.tStart = t  # local t and not account for scr refresh
        Resp6_2.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Resp6_2, 'tStartRefresh')  # time at next scr refresh
        Resp6_2.setAutoDraw(True)
    
    # *Resp7_2* updates
    if Resp7_2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Resp7_2.frameNStart = frameN  # exact frame index
        Resp7_2.tStart = t  # local t and not account for scr refresh
        Resp7_2.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Resp7_2, 'tStartRefresh')  # time at next scr refresh
        Resp7_2.setAutoDraw(True)
    
    # *Resp8_2* updates
    if Resp8_2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Resp8_2.frameNStart = frameN  # exact frame index
        Resp8_2.tStart = t  # local t and not account for scr refresh
        Resp8_2.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Resp8_2, 'tStartRefresh')  # time at next scr refresh
        Resp8_2.setAutoDraw(True)
    if len(Prac1.clicked_name)>0:
     if Prac1.isPressedIn(Mat1_2):
        Resp1_2.opacity=1
        Resp2_2.opacity=0
        Resp3_2.opacity=0
        Resp4_2.opacity=0
        Resp5_2.opacity=0
        Resp6_2.opacity=0
        Resp7_2.opacity=0
        Resp8_2.opacity=0
     elif Prac1.isPressedIn(Mat2_2):
        Resp1_2.opacity=0
        Resp2_2.opacity=1
        Resp3_2.opacity=0
        Resp4_2.opacity=0
        Resp5_2.opacity=0
        Resp6_2.opacity=0
        Resp7_2.opacity=0
        Resp8_2.opacity=0
     elif Prac1.isPressedIn(Mat3_2):
        Resp1_2.opacity=0
        Resp2_2.opacity=0
        Resp3_2.opacity=1
        Resp4_2.opacity=0
        Resp5_2.opacity=0
        Resp6_2.opacity=0
        Resp7_2.opacity=0
        Resp8_2.opacity=0
     elif Prac1.isPressedIn(Mat4_2):
        Resp1_2.opacity=0
        Resp2_2.opacity=0
        Resp3_2.opacity=0
        Resp4_2.opacity=1
        Resp5_2.opacity=0
        Resp6_2.opacity=0
        Resp7_2.opacity=0
        Resp8_2.opacity=0
     elif Prac1.isPressedIn(Mat5_2):
        Resp1_2.opacity=0
        Resp2_2.opacity=0
        Resp3_2.opacity=0
        Resp4_2.opacity=0
        Resp5_2.opacity=1
        Resp6_2.opacity=0
        Resp7_2.opacity=0
        Resp8_2.opacity=0
     elif Prac1.isPressedIn(Mat6_2):
        Resp1_2.opacity=0
        Resp2_2.opacity=0
        Resp3_2.opacity=0
        Resp4_2.opacity=0
        Resp5_2.opacity=0
        Resp6_2.opacity=1
        Resp7_2.opacity=0
        Resp8_2.opacity=0
     elif Prac1.isPressedIn(Mat7_2):
        Resp1_2.opacity=0
        Resp2_2.opacity=0
        Resp3_2.opacity=0
        Resp4_2.opacity=0
        Resp5_2.opacity=0
        Resp6_2.opacity=0
        Resp7_2.opacity=1
        Resp8_2.opacity=0
     elif Prac1.isPressedIn(Mat8_2):
        Resp1_2.opacity=0
        Resp2_2.opacity=0
        Resp3_2.opacity=0
        Resp4_2.opacity=0
        Resp5_2.opacity=0
        Resp6_2.opacity=0
        Resp7_2.opacity=0
        Resp8_2.opacity=1
    if mouse_final_2.isPressedIn(Next_2):
        continueRoutine = False
    # *mouse_final_2* updates
    if mouse_final_2.status == NOT_STARTED and t >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        mouse_final_2.frameNStart = frameN  # exact frame index
        mouse_final_2.tStart = t  # local t and not account for scr refresh
        mouse_final_2.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(mouse_final_2, 'tStartRefresh')  # time at next scr refresh
        mouse_final_2.status = STARTED
        mouse_final_2.mouseClock.reset()
        prevButtonState = mouse_final_2.getPressed()  # if button is down already this ISN'T a new click
    if mouse_final_2.status == STARTED:  # only update if started and not finished!
        buttons = mouse_final_2.getPressed()
        if buttons != prevButtonState:  # button state changed?
            prevButtonState = buttons
            if sum(buttons) > 0:  # state changed to a new click
                # check if the mouse was inside our 'clickable' objects
                gotValidClick = False
                try:
                    iter(Next_2)
                    clickableList = Next_2
                except:
                    clickableList = [Next_2]
                for obj in clickableList:
                    if obj.contains(mouse_final_2):
                        gotValidClick = True
                        mouse_final_2.clicked_name.append(obj.name)
                if gotValidClick:  
                    continueRoutine = False  # abort routine on response
    
    # *Text* updates
    if Text.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Text.frameNStart = frameN  # exact frame index
        Text.tStart = t  # local t and not account for scr refresh
        Text.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Text, 'tStartRefresh')  # time at next scr refresh
        Text.setAutoDraw(True)
    
    # *Next_2* updates
    if Next_2.status == NOT_STARTED and len(Prac1.clicked_name)>0:
        # keep track of start time/frame for later
        Next_2.frameNStart = frameN  # exact frame index
        Next_2.tStart = t  # local t and not account for scr refresh
        Next_2.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Next_2, 'tStartRefresh')  # time at next scr refresh
        Next_2.setAutoDraw(True)
    
    # *Logo* updates
    if Logo.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Logo.frameNStart = frameN  # exact frame index
        Logo.tStart = t  # local t and not account for scr refresh
        Logo.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Logo, 'tStartRefresh')  # time at next scr refresh
        Logo.setAutoDraw(True)
    
    # check for quit (typically the Esc key)
    if endExpNow or defaultKeyboard.getKeys(keyList=["escape"]):
        core.quit()
    
    # check if all components have finished
    if not continueRoutine:  # a component has requested a forced-end of Routine
        break
    continueRoutine = False  # will revert to True if at least one component still running
    for thisComponent in Instruction1Components:
        if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
            continueRoutine = True
            break  # at least one component has not yet finished
    
    # refresh the screen
    if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
        win.flip()

# -------Ending Routine "Instruction1"-------
for thisComponent in Instruction1Components:
    if hasattr(thisComponent, "setAutoDraw"):
        thisComponent.setAutoDraw(False)
thisExp.addData('Probe_2.started', Probe_2.tStartRefresh)
thisExp.addData('Probe_2.stopped', Probe_2.tStopRefresh)
# store data for thisExp (ExperimentHandler)
thisExp.addData('Prac1.x', Prac1.x)
thisExp.addData('Prac1.y', Prac1.y)
thisExp.addData('Prac1.leftButton', Prac1.leftButton)
thisExp.addData('Prac1.midButton', Prac1.midButton)
thisExp.addData('Prac1.rightButton', Prac1.rightButton)
thisExp.addData('Prac1.time', Prac1.time)
thisExp.addData('Prac1.clicked_name', Prac1.clicked_name)
thisExp.addData('Prac1.started', Prac1.tStart)
thisExp.addData('Prac1.stopped', Prac1.tStop)
thisExp.nextEntry()
thisExp.addData('Mat1_2.started', Mat1_2.tStartRefresh)
thisExp.addData('Mat1_2.stopped', Mat1_2.tStopRefresh)
thisExp.addData('Mat2_2.started', Mat2_2.tStartRefresh)
thisExp.addData('Mat2_2.stopped', Mat2_2.tStopRefresh)
thisExp.addData('Mat3_2.started', Mat3_2.tStartRefresh)
thisExp.addData('Mat3_2.stopped', Mat3_2.tStopRefresh)
thisExp.addData('Mat4_2.started', Mat4_2.tStartRefresh)
thisExp.addData('Mat4_2.stopped', Mat4_2.tStopRefresh)
thisExp.addData('Mat5_2.started', Mat5_2.tStartRefresh)
thisExp.addData('Mat5_2.stopped', Mat5_2.tStopRefresh)
thisExp.addData('Mat6_2.started', Mat6_2.tStartRefresh)
thisExp.addData('Mat6_2.stopped', Mat6_2.tStopRefresh)
thisExp.addData('Mat7_2.started', Mat7_2.tStartRefresh)
thisExp.addData('Mat7_2.stopped', Mat7_2.tStopRefresh)
thisExp.addData('Mat8_2.started', Mat8_2.tStartRefresh)
thisExp.addData('Mat8_2.stopped', Mat8_2.tStopRefresh)
thisExp.addData('Resp1_2.started', Resp1_2.tStartRefresh)
thisExp.addData('Resp1_2.stopped', Resp1_2.tStopRefresh)
thisExp.addData('Resp2_2.started', Resp2_2.tStartRefresh)
thisExp.addData('Resp2_2.stopped', Resp2_2.tStopRefresh)
thisExp.addData('Resp3_2.started', Resp3_2.tStartRefresh)
thisExp.addData('Resp3_2.stopped', Resp3_2.tStopRefresh)
thisExp.addData('Resp4_2.started', Resp4_2.tStartRefresh)
thisExp.addData('Resp4_2.stopped', Resp4_2.tStopRefresh)
thisExp.addData('Resp5_2.started', Resp5_2.tStartRefresh)
thisExp.addData('Resp5_2.stopped', Resp5_2.tStopRefresh)
thisExp.addData('Resp6_2.started', Resp6_2.tStartRefresh)
thisExp.addData('Resp6_2.stopped', Resp6_2.tStopRefresh)
thisExp.addData('Resp7_2.started', Resp7_2.tStartRefresh)
thisExp.addData('Resp7_2.stopped', Resp7_2.tStopRefresh)
thisExp.addData('Resp8_2.started', Resp8_2.tStartRefresh)
thisExp.addData('Resp8_2.stopped', Resp8_2.tStopRefresh)
# store data for thisExp (ExperimentHandler)
x, y = mouse_final_2.getPos()
buttons = mouse_final_2.getPressed()
if sum(buttons):
    # check if the mouse was inside our 'clickable' objects
    gotValidClick = False
    try:
        iter(Next_2)
        clickableList = Next_2
    except:
        clickableList = [Next_2]
    for obj in clickableList:
        if obj.contains(mouse_final_2):
            gotValidClick = True
            mouse_final_2.clicked_name.append(obj.name)
thisExp.addData('mouse_final_2.x', x)
thisExp.addData('mouse_final_2.y', y)
thisExp.addData('mouse_final_2.leftButton', buttons[0])
thisExp.addData('mouse_final_2.midButton', buttons[1])
thisExp.addData('mouse_final_2.rightButton', buttons[2])
if len(mouse_final_2.clicked_name):
    thisExp.addData('mouse_final_2.clicked_name', mouse_final_2.clicked_name[0])
thisExp.addData('mouse_final_2.started', mouse_final_2.tStart)
thisExp.addData('mouse_final_2.stopped', mouse_final_2.tStop)
thisExp.nextEntry()
thisExp.addData('Text.started', Text.tStartRefresh)
thisExp.addData('Text.stopped', Text.tStopRefresh)
thisExp.addData('Next_2.started', Next_2.tStartRefresh)
thisExp.addData('Next_2.stopped', Next_2.tStopRefresh)
thisExp.addData('Logo.started', Logo.tStartRefresh)
thisExp.addData('Logo.stopped', Logo.tStopRefresh)
# the Routine "Instruction1" was not non-slip safe, so reset the non-slip timer
routineTimer.reset()

# ------Prepare to start Routine "Instruction2"-------
continueRoutine = True
# update component parameters for each repeat
Instruction1_2.alignText = 'left'
# setup some python lists for storing info about the mouse_Prac_1_sol
mouse_Prac_1_sol.clicked_name = []
gotValidClick = False  # until a click is received
# keep track of which components have finished
Instruction2Components = [Instruction1_2, mouse_Prac_1_sol, Prac_1, Prac_1_9, Prac_1_10, Prac_1_11, Prac_1_12, Prac_1_13, Prac_1_14, Prac_1_15, Prac1_2, Prac_1_Resp1_2, Logo_2, Next_Inst_sol]
for thisComponent in Instruction2Components:
    thisComponent.tStart = None
    thisComponent.tStop = None
    thisComponent.tStartRefresh = None
    thisComponent.tStopRefresh = None
    if hasattr(thisComponent, 'status'):
        thisComponent.status = NOT_STARTED
# reset timers
t = 0
_timeToFirstFrame = win.getFutureFlipTime(clock="now")
Instruction2Clock.reset(-_timeToFirstFrame)  # t0 is time of first possible flip
frameN = -1

# -------Run Routine "Instruction2"-------
while continueRoutine:
    # get current time
    t = Instruction2Clock.getTime()
    tThisFlip = win.getFutureFlipTime(clock=Instruction2Clock)
    tThisFlipGlobal = win.getFutureFlipTime(clock=None)
    frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
    # update/draw components on each frame
    
    # *Instruction1_2* updates
    if Instruction1_2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Instruction1_2.frameNStart = frameN  # exact frame index
        Instruction1_2.tStart = t  # local t and not account for scr refresh
        Instruction1_2.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Instruction1_2, 'tStartRefresh')  # time at next scr refresh
        Instruction1_2.setAutoDraw(True)
    # *mouse_Prac_1_sol* updates
    if mouse_Prac_1_sol.status == NOT_STARTED and t >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        mouse_Prac_1_sol.frameNStart = frameN  # exact frame index
        mouse_Prac_1_sol.tStart = t  # local t and not account for scr refresh
        mouse_Prac_1_sol.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(mouse_Prac_1_sol, 'tStartRefresh')  # time at next scr refresh
        mouse_Prac_1_sol.status = STARTED
        mouse_Prac_1_sol.mouseClock.reset()
        prevButtonState = mouse_Prac_1_sol.getPressed()  # if button is down already this ISN'T a new click
    if mouse_Prac_1_sol.status == STARTED:  # only update if started and not finished!
        buttons = mouse_Prac_1_sol.getPressed()
        if buttons != prevButtonState:  # button state changed?
            prevButtonState = buttons
            if sum(buttons) > 0:  # state changed to a new click
                # check if the mouse was inside our 'clickable' objects
                gotValidClick = False
                try:
                    iter(Next_Inst_sol)
                    clickableList = Next_Inst_sol
                except:
                    clickableList = [Next_Inst_sol]
                for obj in clickableList:
                    if obj.contains(mouse_Prac_1_sol):
                        gotValidClick = True
                        mouse_Prac_1_sol.clicked_name.append(obj.name)
                if gotValidClick:  
                    continueRoutine = False  # abort routine on response
    
    # *Prac_1* updates
    if Prac_1.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Prac_1.frameNStart = frameN  # exact frame index
        Prac_1.tStart = t  # local t and not account for scr refresh
        Prac_1.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Prac_1, 'tStartRefresh')  # time at next scr refresh
        Prac_1.setAutoDraw(True)
    
    # *Prac_1_9* updates
    if Prac_1_9.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Prac_1_9.frameNStart = frameN  # exact frame index
        Prac_1_9.tStart = t  # local t and not account for scr refresh
        Prac_1_9.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Prac_1_9, 'tStartRefresh')  # time at next scr refresh
        Prac_1_9.setAutoDraw(True)
    
    # *Prac_1_10* updates
    if Prac_1_10.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Prac_1_10.frameNStart = frameN  # exact frame index
        Prac_1_10.tStart = t  # local t and not account for scr refresh
        Prac_1_10.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Prac_1_10, 'tStartRefresh')  # time at next scr refresh
        Prac_1_10.setAutoDraw(True)
    
    # *Prac_1_11* updates
    if Prac_1_11.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Prac_1_11.frameNStart = frameN  # exact frame index
        Prac_1_11.tStart = t  # local t and not account for scr refresh
        Prac_1_11.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Prac_1_11, 'tStartRefresh')  # time at next scr refresh
        Prac_1_11.setAutoDraw(True)
    
    # *Prac_1_12* updates
    if Prac_1_12.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Prac_1_12.frameNStart = frameN  # exact frame index
        Prac_1_12.tStart = t  # local t and not account for scr refresh
        Prac_1_12.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Prac_1_12, 'tStartRefresh')  # time at next scr refresh
        Prac_1_12.setAutoDraw(True)
    
    # *Prac_1_13* updates
    if Prac_1_13.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Prac_1_13.frameNStart = frameN  # exact frame index
        Prac_1_13.tStart = t  # local t and not account for scr refresh
        Prac_1_13.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Prac_1_13, 'tStartRefresh')  # time at next scr refresh
        Prac_1_13.setAutoDraw(True)
    
    # *Prac_1_14* updates
    if Prac_1_14.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Prac_1_14.frameNStart = frameN  # exact frame index
        Prac_1_14.tStart = t  # local t and not account for scr refresh
        Prac_1_14.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Prac_1_14, 'tStartRefresh')  # time at next scr refresh
        Prac_1_14.setAutoDraw(True)
    
    # *Prac_1_15* updates
    if Prac_1_15.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Prac_1_15.frameNStart = frameN  # exact frame index
        Prac_1_15.tStart = t  # local t and not account for scr refresh
        Prac_1_15.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Prac_1_15, 'tStartRefresh')  # time at next scr refresh
        Prac_1_15.setAutoDraw(True)
    
    # *Prac1_2* updates
    if Prac1_2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Prac1_2.frameNStart = frameN  # exact frame index
        Prac1_2.tStart = t  # local t and not account for scr refresh
        Prac1_2.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Prac1_2, 'tStartRefresh')  # time at next scr refresh
        Prac1_2.setAutoDraw(True)
    
    # *Prac_1_Resp1_2* updates
    if Prac_1_Resp1_2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Prac_1_Resp1_2.frameNStart = frameN  # exact frame index
        Prac_1_Resp1_2.tStart = t  # local t and not account for scr refresh
        Prac_1_Resp1_2.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Prac_1_Resp1_2, 'tStartRefresh')  # time at next scr refresh
        Prac_1_Resp1_2.setAutoDraw(True)
    
    # *Logo_2* updates
    if Logo_2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Logo_2.frameNStart = frameN  # exact frame index
        Logo_2.tStart = t  # local t and not account for scr refresh
        Logo_2.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Logo_2, 'tStartRefresh')  # time at next scr refresh
        Logo_2.setAutoDraw(True)
    
    # *Next_Inst_sol* updates
    if Next_Inst_sol.status == NOT_STARTED and tThisFlip >= 0-frameTolerance:
        # keep track of start time/frame for later
        Next_Inst_sol.frameNStart = frameN  # exact frame index
        Next_Inst_sol.tStart = t  # local t and not account for scr refresh
        Next_Inst_sol.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Next_Inst_sol, 'tStartRefresh')  # time at next scr refresh
        Next_Inst_sol.setAutoDraw(True)
    
    # check for quit (typically the Esc key)
    if endExpNow or defaultKeyboard.getKeys(keyList=["escape"]):
        core.quit()
    
    # check if all components have finished
    if not continueRoutine:  # a component has requested a forced-end of Routine
        break
    continueRoutine = False  # will revert to True if at least one component still running
    for thisComponent in Instruction2Components:
        if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
            continueRoutine = True
            break  # at least one component has not yet finished
    
    # refresh the screen
    if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
        win.flip()

# -------Ending Routine "Instruction2"-------
for thisComponent in Instruction2Components:
    if hasattr(thisComponent, "setAutoDraw"):
        thisComponent.setAutoDraw(False)
thisExp.addData('Instruction1_2.started', Instruction1_2.tStartRefresh)
thisExp.addData('Instruction1_2.stopped', Instruction1_2.tStopRefresh)
# store data for thisExp (ExperimentHandler)
x, y = mouse_Prac_1_sol.getPos()
buttons = mouse_Prac_1_sol.getPressed()
if sum(buttons):
    # check if the mouse was inside our 'clickable' objects
    gotValidClick = False
    try:
        iter(Next_Inst_sol)
        clickableList = Next_Inst_sol
    except:
        clickableList = [Next_Inst_sol]
    for obj in clickableList:
        if obj.contains(mouse_Prac_1_sol):
            gotValidClick = True
            mouse_Prac_1_sol.clicked_name.append(obj.name)
thisExp.addData('mouse_Prac_1_sol.x', x)
thisExp.addData('mouse_Prac_1_sol.y', y)
thisExp.addData('mouse_Prac_1_sol.leftButton', buttons[0])
thisExp.addData('mouse_Prac_1_sol.midButton', buttons[1])
thisExp.addData('mouse_Prac_1_sol.rightButton', buttons[2])
if len(mouse_Prac_1_sol.clicked_name):
    thisExp.addData('mouse_Prac_1_sol.clicked_name', mouse_Prac_1_sol.clicked_name[0])
thisExp.addData('mouse_Prac_1_sol.started', mouse_Prac_1_sol.tStart)
thisExp.addData('mouse_Prac_1_sol.stopped', mouse_Prac_1_sol.tStop)
thisExp.nextEntry()
thisExp.addData('Prac_1.started', Prac_1.tStartRefresh)
thisExp.addData('Prac_1.stopped', Prac_1.tStopRefresh)
thisExp.addData('Prac_1_9.started', Prac_1_9.tStartRefresh)
thisExp.addData('Prac_1_9.stopped', Prac_1_9.tStopRefresh)
thisExp.addData('Prac_1_10.started', Prac_1_10.tStartRefresh)
thisExp.addData('Prac_1_10.stopped', Prac_1_10.tStopRefresh)
thisExp.addData('Prac_1_11.started', Prac_1_11.tStartRefresh)
thisExp.addData('Prac_1_11.stopped', Prac_1_11.tStopRefresh)
thisExp.addData('Prac_1_12.started', Prac_1_12.tStartRefresh)
thisExp.addData('Prac_1_12.stopped', Prac_1_12.tStopRefresh)
thisExp.addData('Prac_1_13.started', Prac_1_13.tStartRefresh)
thisExp.addData('Prac_1_13.stopped', Prac_1_13.tStopRefresh)
thisExp.addData('Prac_1_14.started', Prac_1_14.tStartRefresh)
thisExp.addData('Prac_1_14.stopped', Prac_1_14.tStopRefresh)
thisExp.addData('Prac_1_15.started', Prac_1_15.tStartRefresh)
thisExp.addData('Prac_1_15.stopped', Prac_1_15.tStopRefresh)
thisExp.addData('Prac1_2.started', Prac1_2.tStartRefresh)
thisExp.addData('Prac1_2.stopped', Prac1_2.tStopRefresh)
thisExp.addData('Prac_1_Resp1_2.started', Prac_1_Resp1_2.tStartRefresh)
thisExp.addData('Prac_1_Resp1_2.stopped', Prac_1_Resp1_2.tStopRefresh)
thisExp.addData('Logo_2.started', Logo_2.tStartRefresh)
thisExp.addData('Logo_2.stopped', Logo_2.tStopRefresh)
thisExp.addData('Next_Inst_sol.started', Next_Inst_sol.tStartRefresh)
thisExp.addData('Next_Inst_sol.stopped', Next_Inst_sol.tStopRefresh)
# the Routine "Instruction2" was not non-slip safe, so reset the non-slip timer
routineTimer.reset()

# ------Prepare to start Routine "ITI"-------
continueRoutine = True
routineTimer.add(0.500000)
# update component parameters for each repeat
# keep track of which components have finished
ITIComponents = [White]
for thisComponent in ITIComponents:
    thisComponent.tStart = None
    thisComponent.tStop = None
    thisComponent.tStartRefresh = None
    thisComponent.tStopRefresh = None
    if hasattr(thisComponent, 'status'):
        thisComponent.status = NOT_STARTED
# reset timers
t = 0
_timeToFirstFrame = win.getFutureFlipTime(clock="now")
ITIClock.reset(-_timeToFirstFrame)  # t0 is time of first possible flip
frameN = -1

# -------Run Routine "ITI"-------
while continueRoutine and routineTimer.getTime() > 0:
    # get current time
    t = ITIClock.getTime()
    tThisFlip = win.getFutureFlipTime(clock=ITIClock)
    tThisFlipGlobal = win.getFutureFlipTime(clock=None)
    frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
    # update/draw components on each frame
    
    # *White* updates
    if White.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        White.frameNStart = frameN  # exact frame index
        White.tStart = t  # local t and not account for scr refresh
        White.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(White, 'tStartRefresh')  # time at next scr refresh
        White.setAutoDraw(True)
    if White.status == STARTED:
        # is it time to stop? (based on global clock, using actual start)
        if tThisFlipGlobal > White.tStartRefresh + 0.5-frameTolerance:
            # keep track of stop time/frame for later
            White.tStop = t  # not accounting for scr refresh
            White.frameNStop = frameN  # exact frame index
            win.timeOnFlip(White, 'tStopRefresh')  # time at next scr refresh
            White.setAutoDraw(False)
    
    # check for quit (typically the Esc key)
    if endExpNow or defaultKeyboard.getKeys(keyList=["escape"]):
        core.quit()
    
    # check if all components have finished
    if not continueRoutine:  # a component has requested a forced-end of Routine
        break
    continueRoutine = False  # will revert to True if at least one component still running
    for thisComponent in ITIComponents:
        if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
            continueRoutine = True
            break  # at least one component has not yet finished
    
    # refresh the screen
    if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
        win.flip()

# -------Ending Routine "ITI"-------
for thisComponent in ITIComponents:
    if hasattr(thisComponent, "setAutoDraw"):
        thisComponent.setAutoDraw(False)
thisExp.addData('White.started', White.tStartRefresh)
thisExp.addData('White.stopped', White.tStopRefresh)

# ------Prepare to start Routine "Instruction3_2"-------
continueRoutine = True
# update component parameters for each repeat
# setup some python lists for storing info about the Prac1_3
Prac1_3.x = []
Prac1_3.y = []
Prac1_3.leftButton = []
Prac1_3.midButton = []
Prac1_3.rightButton = []
Prac1_3.time = []
Prac1_3.clicked_name = []
gotValidClick = False  # until a click is received
Prac1_3.mouseClock.reset()
Resp1_3.opacity=0
Resp2_3.opacity=0
Resp3_3.opacity=0
Resp4_3.opacity=0
Resp5_3.opacity=0
Resp6_3.opacity=0
Resp7_3.opacity=0
Resp8_3.opacity=0
# setup some python lists for storing info about the mouse_final_3
mouse_final_3.clicked_name = []
gotValidClick = False  # until a click is received
Text_2.alignText = 'left'
# keep track of which components have finished
Instruction3_2Components = [Probe_3, Prac1_3, Mat1_3, Mat2_3, Mat3_3, Mat4_3, Mat5_3, Mat6_3, Mat7_3, Mat8_3, Resp1_3, Resp2_3, Resp3_3, Resp4_3, Resp5_3, Resp6_3, Resp7_3, Resp8_3, mouse_final_3, Text_2, Next_3, Logo_7]
for thisComponent in Instruction3_2Components:
    thisComponent.tStart = None
    thisComponent.tStop = None
    thisComponent.tStartRefresh = None
    thisComponent.tStopRefresh = None
    if hasattr(thisComponent, 'status'):
        thisComponent.status = NOT_STARTED
# reset timers
t = 0
_timeToFirstFrame = win.getFutureFlipTime(clock="now")
Instruction3_2Clock.reset(-_timeToFirstFrame)  # t0 is time of first possible flip
frameN = -1

# -------Run Routine "Instruction3_2"-------
while continueRoutine:
    # get current time
    t = Instruction3_2Clock.getTime()
    tThisFlip = win.getFutureFlipTime(clock=Instruction3_2Clock)
    tThisFlipGlobal = win.getFutureFlipTime(clock=None)
    frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
    # update/draw components on each frame
    
    # *Probe_3* updates
    if Probe_3.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Probe_3.frameNStart = frameN  # exact frame index
        Probe_3.tStart = t  # local t and not account for scr refresh
        Probe_3.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Probe_3, 'tStartRefresh')  # time at next scr refresh
        Probe_3.setAutoDraw(True)
    # *Prac1_3* updates
    if Prac1_3.status == NOT_STARTED and t >= 0.1-frameTolerance:
        # keep track of start time/frame for later
        Prac1_3.frameNStart = frameN  # exact frame index
        Prac1_3.tStart = t  # local t and not account for scr refresh
        Prac1_3.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Prac1_3, 'tStartRefresh')  # time at next scr refresh
        Prac1_3.status = STARTED
        prevButtonState = Prac1_3.getPressed()  # if button is down already this ISN'T a new click
    if Prac1_3.status == STARTED:  # only update if started and not finished!
        buttons = Prac1_3.getPressed()
        if buttons != prevButtonState:  # button state changed?
            prevButtonState = buttons
            if sum(buttons) > 0:  # state changed to a new click
                # check if the mouse was inside our 'clickable' objects
                gotValidClick = False
                try:
                    iter([Mat1_3, Mat2_3, Mat3_3, Mat4_3, Mat5_3, Mat6_3, Mat7_3, Mat8_3])
                    clickableList = [Mat1_3, Mat2_3, Mat3_3, Mat4_3, Mat5_3, Mat6_3, Mat7_3, Mat8_3]
                except:
                    clickableList = [[Mat1_3, Mat2_3, Mat3_3, Mat4_3, Mat5_3, Mat6_3, Mat7_3, Mat8_3]]
                for obj in clickableList:
                    if obj.contains(Prac1_3):
                        gotValidClick = True
                        Prac1_3.clicked_name.append(obj.name)
                x, y = Prac1_3.getPos()
                Prac1_3.x.append(x)
                Prac1_3.y.append(y)
                buttons = Prac1_3.getPressed()
                Prac1_3.leftButton.append(buttons[0])
                Prac1_3.midButton.append(buttons[1])
                Prac1_3.rightButton.append(buttons[2])
                Prac1_3.time.append(Prac1_3.mouseClock.getTime())
    
    # *Mat1_3* updates
    if Mat1_3.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Mat1_3.frameNStart = frameN  # exact frame index
        Mat1_3.tStart = t  # local t and not account for scr refresh
        Mat1_3.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Mat1_3, 'tStartRefresh')  # time at next scr refresh
        Mat1_3.setAutoDraw(True)
    
    # *Mat2_3* updates
    if Mat2_3.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Mat2_3.frameNStart = frameN  # exact frame index
        Mat2_3.tStart = t  # local t and not account for scr refresh
        Mat2_3.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Mat2_3, 'tStartRefresh')  # time at next scr refresh
        Mat2_3.setAutoDraw(True)
    
    # *Mat3_3* updates
    if Mat3_3.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Mat3_3.frameNStart = frameN  # exact frame index
        Mat3_3.tStart = t  # local t and not account for scr refresh
        Mat3_3.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Mat3_3, 'tStartRefresh')  # time at next scr refresh
        Mat3_3.setAutoDraw(True)
    
    # *Mat4_3* updates
    if Mat4_3.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Mat4_3.frameNStart = frameN  # exact frame index
        Mat4_3.tStart = t  # local t and not account for scr refresh
        Mat4_3.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Mat4_3, 'tStartRefresh')  # time at next scr refresh
        Mat4_3.setAutoDraw(True)
    
    # *Mat5_3* updates
    if Mat5_3.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Mat5_3.frameNStart = frameN  # exact frame index
        Mat5_3.tStart = t  # local t and not account for scr refresh
        Mat5_3.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Mat5_3, 'tStartRefresh')  # time at next scr refresh
        Mat5_3.setAutoDraw(True)
    
    # *Mat6_3* updates
    if Mat6_3.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Mat6_3.frameNStart = frameN  # exact frame index
        Mat6_3.tStart = t  # local t and not account for scr refresh
        Mat6_3.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Mat6_3, 'tStartRefresh')  # time at next scr refresh
        Mat6_3.setAutoDraw(True)
    
    # *Mat7_3* updates
    if Mat7_3.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Mat7_3.frameNStart = frameN  # exact frame index
        Mat7_3.tStart = t  # local t and not account for scr refresh
        Mat7_3.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Mat7_3, 'tStartRefresh')  # time at next scr refresh
        Mat7_3.setAutoDraw(True)
    
    # *Mat8_3* updates
    if Mat8_3.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Mat8_3.frameNStart = frameN  # exact frame index
        Mat8_3.tStart = t  # local t and not account for scr refresh
        Mat8_3.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Mat8_3, 'tStartRefresh')  # time at next scr refresh
        Mat8_3.setAutoDraw(True)
    
    # *Resp1_3* updates
    if Resp1_3.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Resp1_3.frameNStart = frameN  # exact frame index
        Resp1_3.tStart = t  # local t and not account for scr refresh
        Resp1_3.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Resp1_3, 'tStartRefresh')  # time at next scr refresh
        Resp1_3.setAutoDraw(True)
    
    # *Resp2_3* updates
    if Resp2_3.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Resp2_3.frameNStart = frameN  # exact frame index
        Resp2_3.tStart = t  # local t and not account for scr refresh
        Resp2_3.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Resp2_3, 'tStartRefresh')  # time at next scr refresh
        Resp2_3.setAutoDraw(True)
    
    # *Resp3_3* updates
    if Resp3_3.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Resp3_3.frameNStart = frameN  # exact frame index
        Resp3_3.tStart = t  # local t and not account for scr refresh
        Resp3_3.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Resp3_3, 'tStartRefresh')  # time at next scr refresh
        Resp3_3.setAutoDraw(True)
    
    # *Resp4_3* updates
    if Resp4_3.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Resp4_3.frameNStart = frameN  # exact frame index
        Resp4_3.tStart = t  # local t and not account for scr refresh
        Resp4_3.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Resp4_3, 'tStartRefresh')  # time at next scr refresh
        Resp4_3.setAutoDraw(True)
    
    # *Resp5_3* updates
    if Resp5_3.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Resp5_3.frameNStart = frameN  # exact frame index
        Resp5_3.tStart = t  # local t and not account for scr refresh
        Resp5_3.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Resp5_3, 'tStartRefresh')  # time at next scr refresh
        Resp5_3.setAutoDraw(True)
    
    # *Resp6_3* updates
    if Resp6_3.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Resp6_3.frameNStart = frameN  # exact frame index
        Resp6_3.tStart = t  # local t and not account for scr refresh
        Resp6_3.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Resp6_3, 'tStartRefresh')  # time at next scr refresh
        Resp6_3.setAutoDraw(True)
    
    # *Resp7_3* updates
    if Resp7_3.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Resp7_3.frameNStart = frameN  # exact frame index
        Resp7_3.tStart = t  # local t and not account for scr refresh
        Resp7_3.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Resp7_3, 'tStartRefresh')  # time at next scr refresh
        Resp7_3.setAutoDraw(True)
    
    # *Resp8_3* updates
    if Resp8_3.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Resp8_3.frameNStart = frameN  # exact frame index
        Resp8_3.tStart = t  # local t and not account for scr refresh
        Resp8_3.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Resp8_3, 'tStartRefresh')  # time at next scr refresh
        Resp8_3.setAutoDraw(True)
    if len(Prac1_3.clicked_name)>0:
     if Prac1_3.isPressedIn(Mat1_3):
        Resp1_3.opacity=1
        Resp2_3.opacity=0
        Resp3_3.opacity=0
        Resp4_3.opacity=0
        Resp5_3.opacity=0
        Resp6_3.opacity=0
        Resp7_3.opacity=0
        Resp8_3.opacity=0
     elif Prac1_3.isPressedIn(Mat2_3):
        Resp1_3.opacity=0
        Resp2_3.opacity=1
        Resp3_3.opacity=0
        Resp4_3.opacity=0
        Resp5_3.opacity=0
        Resp6_3.opacity=0
        Resp7_3.opacity=0
        Resp8_3.opacity=0
     elif Prac1_3.isPressedIn(Mat3_3):
        Resp1_3.opacity=0
        Resp2_3.opacity=0
        Resp3_3.opacity=1
        Resp4_3.opacity=0
        Resp5_3.opacity=0
        Resp6_3.opacity=0
        Resp7_3.opacity=0
        Resp8_3.opacity=0
     elif Prac1_3.isPressedIn(Mat4_3):
        Resp1_3.opacity=0
        Resp2_3.opacity=0
        Resp3_3.opacity=0
        Resp4_3.opacity=1
        Resp5_3.opacity=0
        Resp6_3.opacity=0
        Resp7_3.opacity=0
        Resp8_3.opacity=0
     elif Prac1_3.isPressedIn(Mat5_3):
        Resp1_3.opacity=0
        Resp2_3.opacity=0
        Resp3_3.opacity=0
        Resp4_3.opacity=0
        Resp5_3.opacity=1
        Resp6_3.opacity=0
        Resp7_3.opacity=0
        Resp8_3.opacity=0
     elif Prac1_3.isPressedIn(Mat6_3):
        Resp1_3.opacity=0
        Resp2_3.opacity=0
        Resp3_3.opacity=0
        Resp4_3.opacity=0
        Resp5_3.opacity=0
        Resp6_3.opacity=1
        Resp7_3.opacity=0
        Resp8_3.opacity=0
     elif Prac1_3.isPressedIn(Mat7_3):
        Resp1_3.opacity=0
        Resp2_3.opacity=0
        Resp3_3.opacity=0
        Resp4_3.opacity=0
        Resp5_3.opacity=0
        Resp6_3.opacity=0
        Resp7_3.opacity=1
        Resp8_3.opacity=0
     elif Prac1_3.isPressedIn(Mat8_3):
        Resp1_3.opacity=0
        Resp2_3.opacity=0
        Resp3_3.opacity=0
        Resp4_3.opacity=0
        Resp5_3.opacity=0
        Resp6_3.opacity=0
        Resp7_3.opacity=0
        Resp8_3.opacity=1
    if mouse_final_3.isPressedIn(Next_3):
        continueRoutine = False
    # *mouse_final_3* updates
    if mouse_final_3.status == NOT_STARTED and t >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        mouse_final_3.frameNStart = frameN  # exact frame index
        mouse_final_3.tStart = t  # local t and not account for scr refresh
        mouse_final_3.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(mouse_final_3, 'tStartRefresh')  # time at next scr refresh
        mouse_final_3.status = STARTED
        mouse_final_3.mouseClock.reset()
        prevButtonState = mouse_final_3.getPressed()  # if button is down already this ISN'T a new click
    if mouse_final_3.status == STARTED:  # only update if started and not finished!
        buttons = mouse_final_3.getPressed()
        if buttons != prevButtonState:  # button state changed?
            prevButtonState = buttons
            if sum(buttons) > 0:  # state changed to a new click
                # check if the mouse was inside our 'clickable' objects
                gotValidClick = False
                try:
                    iter(Next_3)
                    clickableList = Next_3
                except:
                    clickableList = [Next_3]
                for obj in clickableList:
                    if obj.contains(mouse_final_3):
                        gotValidClick = True
                        mouse_final_3.clicked_name.append(obj.name)
                if gotValidClick:  
                    continueRoutine = False  # abort routine on response
    
    # *Text_2* updates
    if Text_2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Text_2.frameNStart = frameN  # exact frame index
        Text_2.tStart = t  # local t and not account for scr refresh
        Text_2.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Text_2, 'tStartRefresh')  # time at next scr refresh
        Text_2.setAutoDraw(True)
    
    # *Next_3* updates
    if Next_3.status == NOT_STARTED and len(Prac1.clicked_name)>0:
        # keep track of start time/frame for later
        Next_3.frameNStart = frameN  # exact frame index
        Next_3.tStart = t  # local t and not account for scr refresh
        Next_3.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Next_3, 'tStartRefresh')  # time at next scr refresh
        Next_3.setAutoDraw(True)
    
    # *Logo_7* updates
    if Logo_7.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Logo_7.frameNStart = frameN  # exact frame index
        Logo_7.tStart = t  # local t and not account for scr refresh
        Logo_7.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Logo_7, 'tStartRefresh')  # time at next scr refresh
        Logo_7.setAutoDraw(True)
    
    # check for quit (typically the Esc key)
    if endExpNow or defaultKeyboard.getKeys(keyList=["escape"]):
        core.quit()
    
    # check if all components have finished
    if not continueRoutine:  # a component has requested a forced-end of Routine
        break
    continueRoutine = False  # will revert to True if at least one component still running
    for thisComponent in Instruction3_2Components:
        if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
            continueRoutine = True
            break  # at least one component has not yet finished
    
    # refresh the screen
    if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
        win.flip()

# -------Ending Routine "Instruction3_2"-------
for thisComponent in Instruction3_2Components:
    if hasattr(thisComponent, "setAutoDraw"):
        thisComponent.setAutoDraw(False)
thisExp.addData('Probe_3.started', Probe_3.tStartRefresh)
thisExp.addData('Probe_3.stopped', Probe_3.tStopRefresh)
# store data for thisExp (ExperimentHandler)
thisExp.addData('Prac1_3.x', Prac1_3.x)
thisExp.addData('Prac1_3.y', Prac1_3.y)
thisExp.addData('Prac1_3.leftButton', Prac1_3.leftButton)
thisExp.addData('Prac1_3.midButton', Prac1_3.midButton)
thisExp.addData('Prac1_3.rightButton', Prac1_3.rightButton)
thisExp.addData('Prac1_3.time', Prac1_3.time)
thisExp.addData('Prac1_3.clicked_name', Prac1_3.clicked_name)
thisExp.addData('Prac1_3.started', Prac1_3.tStart)
thisExp.addData('Prac1_3.stopped', Prac1_3.tStop)
thisExp.nextEntry()
thisExp.addData('Mat1_3.started', Mat1_3.tStartRefresh)
thisExp.addData('Mat1_3.stopped', Mat1_3.tStopRefresh)
thisExp.addData('Mat2_3.started', Mat2_3.tStartRefresh)
thisExp.addData('Mat2_3.stopped', Mat2_3.tStopRefresh)
thisExp.addData('Mat3_3.started', Mat3_3.tStartRefresh)
thisExp.addData('Mat3_3.stopped', Mat3_3.tStopRefresh)
thisExp.addData('Mat4_3.started', Mat4_3.tStartRefresh)
thisExp.addData('Mat4_3.stopped', Mat4_3.tStopRefresh)
thisExp.addData('Mat5_3.started', Mat5_3.tStartRefresh)
thisExp.addData('Mat5_3.stopped', Mat5_3.tStopRefresh)
thisExp.addData('Mat6_3.started', Mat6_3.tStartRefresh)
thisExp.addData('Mat6_3.stopped', Mat6_3.tStopRefresh)
thisExp.addData('Mat7_3.started', Mat7_3.tStartRefresh)
thisExp.addData('Mat7_3.stopped', Mat7_3.tStopRefresh)
thisExp.addData('Mat8_3.started', Mat8_3.tStartRefresh)
thisExp.addData('Mat8_3.stopped', Mat8_3.tStopRefresh)
thisExp.addData('Resp1_3.started', Resp1_3.tStartRefresh)
thisExp.addData('Resp1_3.stopped', Resp1_3.tStopRefresh)
thisExp.addData('Resp2_3.started', Resp2_3.tStartRefresh)
thisExp.addData('Resp2_3.stopped', Resp2_3.tStopRefresh)
thisExp.addData('Resp3_3.started', Resp3_3.tStartRefresh)
thisExp.addData('Resp3_3.stopped', Resp3_3.tStopRefresh)
thisExp.addData('Resp4_3.started', Resp4_3.tStartRefresh)
thisExp.addData('Resp4_3.stopped', Resp4_3.tStopRefresh)
thisExp.addData('Resp5_3.started', Resp5_3.tStartRefresh)
thisExp.addData('Resp5_3.stopped', Resp5_3.tStopRefresh)
thisExp.addData('Resp6_3.started', Resp6_3.tStartRefresh)
thisExp.addData('Resp6_3.stopped', Resp6_3.tStopRefresh)
thisExp.addData('Resp7_3.started', Resp7_3.tStartRefresh)
thisExp.addData('Resp7_3.stopped', Resp7_3.tStopRefresh)
thisExp.addData('Resp8_3.started', Resp8_3.tStartRefresh)
thisExp.addData('Resp8_3.stopped', Resp8_3.tStopRefresh)
# store data for thisExp (ExperimentHandler)
x, y = mouse_final_3.getPos()
buttons = mouse_final_3.getPressed()
if sum(buttons):
    # check if the mouse was inside our 'clickable' objects
    gotValidClick = False
    try:
        iter(Next_3)
        clickableList = Next_3
    except:
        clickableList = [Next_3]
    for obj in clickableList:
        if obj.contains(mouse_final_3):
            gotValidClick = True
            mouse_final_3.clicked_name.append(obj.name)
thisExp.addData('mouse_final_3.x', x)
thisExp.addData('mouse_final_3.y', y)
thisExp.addData('mouse_final_3.leftButton', buttons[0])
thisExp.addData('mouse_final_3.midButton', buttons[1])
thisExp.addData('mouse_final_3.rightButton', buttons[2])
if len(mouse_final_3.clicked_name):
    thisExp.addData('mouse_final_3.clicked_name', mouse_final_3.clicked_name[0])
thisExp.addData('mouse_final_3.started', mouse_final_3.tStart)
thisExp.addData('mouse_final_3.stopped', mouse_final_3.tStop)
thisExp.nextEntry()
thisExp.addData('Text_2.started', Text_2.tStartRefresh)
thisExp.addData('Text_2.stopped', Text_2.tStopRefresh)
thisExp.addData('Next_3.started', Next_3.tStartRefresh)
thisExp.addData('Next_3.stopped', Next_3.tStopRefresh)
thisExp.addData('Logo_7.started', Logo_7.tStartRefresh)
thisExp.addData('Logo_7.stopped', Logo_7.tStopRefresh)
# the Routine "Instruction3_2" was not non-slip safe, so reset the non-slip timer
routineTimer.reset()

# ------Prepare to start Routine "Instruction4"-------
continueRoutine = True
# update component parameters for each repeat
# setup some python lists for storing info about the mouse_Inst2_2
mouse_Inst2_2.clicked_name = []
gotValidClick = False  # until a click is received
Instruction1_4.alignText = 'left'
# keep track of which components have finished
Instruction4Components = [mouse_Inst2_2, Prac1_4, Instruction1_4, Prac_2, Prac_2_9, Prac_2_10, Prac_2_11, Prac_2_12, Prac_2_13, Prac_2_14, Prac_2_15, Prac_2_Resp6_2, Logo_4, Next_Inst_3]
for thisComponent in Instruction4Components:
    thisComponent.tStart = None
    thisComponent.tStop = None
    thisComponent.tStartRefresh = None
    thisComponent.tStopRefresh = None
    if hasattr(thisComponent, 'status'):
        thisComponent.status = NOT_STARTED
# reset timers
t = 0
_timeToFirstFrame = win.getFutureFlipTime(clock="now")
Instruction4Clock.reset(-_timeToFirstFrame)  # t0 is time of first possible flip
frameN = -1

# -------Run Routine "Instruction4"-------
while continueRoutine:
    # get current time
    t = Instruction4Clock.getTime()
    tThisFlip = win.getFutureFlipTime(clock=Instruction4Clock)
    tThisFlipGlobal = win.getFutureFlipTime(clock=None)
    frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
    # update/draw components on each frame
    # *mouse_Inst2_2* updates
    if mouse_Inst2_2.status == NOT_STARTED and t >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        mouse_Inst2_2.frameNStart = frameN  # exact frame index
        mouse_Inst2_2.tStart = t  # local t and not account for scr refresh
        mouse_Inst2_2.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(mouse_Inst2_2, 'tStartRefresh')  # time at next scr refresh
        mouse_Inst2_2.status = STARTED
        mouse_Inst2_2.mouseClock.reset()
        prevButtonState = mouse_Inst2_2.getPressed()  # if button is down already this ISN'T a new click
    if mouse_Inst2_2.status == STARTED:  # only update if started and not finished!
        buttons = mouse_Inst2_2.getPressed()
        if buttons != prevButtonState:  # button state changed?
            prevButtonState = buttons
            if sum(buttons) > 0:  # state changed to a new click
                # check if the mouse was inside our 'clickable' objects
                gotValidClick = False
                try:
                    iter(Next_Inst_3)
                    clickableList = Next_Inst_3
                except:
                    clickableList = [Next_Inst_3]
                for obj in clickableList:
                    if obj.contains(mouse_Inst2_2):
                        gotValidClick = True
                        mouse_Inst2_2.clicked_name.append(obj.name)
                if gotValidClick:  
                    continueRoutine = False  # abort routine on response
    
    # *Prac1_4* updates
    if Prac1_4.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Prac1_4.frameNStart = frameN  # exact frame index
        Prac1_4.tStart = t  # local t and not account for scr refresh
        Prac1_4.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Prac1_4, 'tStartRefresh')  # time at next scr refresh
        Prac1_4.setAutoDraw(True)
    
    # *Instruction1_4* updates
    if Instruction1_4.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Instruction1_4.frameNStart = frameN  # exact frame index
        Instruction1_4.tStart = t  # local t and not account for scr refresh
        Instruction1_4.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Instruction1_4, 'tStartRefresh')  # time at next scr refresh
        Instruction1_4.setAutoDraw(True)
    
    # *Prac_2* updates
    if Prac_2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Prac_2.frameNStart = frameN  # exact frame index
        Prac_2.tStart = t  # local t and not account for scr refresh
        Prac_2.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Prac_2, 'tStartRefresh')  # time at next scr refresh
        Prac_2.setAutoDraw(True)
    
    # *Prac_2_9* updates
    if Prac_2_9.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Prac_2_9.frameNStart = frameN  # exact frame index
        Prac_2_9.tStart = t  # local t and not account for scr refresh
        Prac_2_9.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Prac_2_9, 'tStartRefresh')  # time at next scr refresh
        Prac_2_9.setAutoDraw(True)
    
    # *Prac_2_10* updates
    if Prac_2_10.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Prac_2_10.frameNStart = frameN  # exact frame index
        Prac_2_10.tStart = t  # local t and not account for scr refresh
        Prac_2_10.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Prac_2_10, 'tStartRefresh')  # time at next scr refresh
        Prac_2_10.setAutoDraw(True)
    
    # *Prac_2_11* updates
    if Prac_2_11.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Prac_2_11.frameNStart = frameN  # exact frame index
        Prac_2_11.tStart = t  # local t and not account for scr refresh
        Prac_2_11.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Prac_2_11, 'tStartRefresh')  # time at next scr refresh
        Prac_2_11.setAutoDraw(True)
    
    # *Prac_2_12* updates
    if Prac_2_12.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Prac_2_12.frameNStart = frameN  # exact frame index
        Prac_2_12.tStart = t  # local t and not account for scr refresh
        Prac_2_12.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Prac_2_12, 'tStartRefresh')  # time at next scr refresh
        Prac_2_12.setAutoDraw(True)
    
    # *Prac_2_13* updates
    if Prac_2_13.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Prac_2_13.frameNStart = frameN  # exact frame index
        Prac_2_13.tStart = t  # local t and not account for scr refresh
        Prac_2_13.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Prac_2_13, 'tStartRefresh')  # time at next scr refresh
        Prac_2_13.setAutoDraw(True)
    
    # *Prac_2_14* updates
    if Prac_2_14.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Prac_2_14.frameNStart = frameN  # exact frame index
        Prac_2_14.tStart = t  # local t and not account for scr refresh
        Prac_2_14.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Prac_2_14, 'tStartRefresh')  # time at next scr refresh
        Prac_2_14.setAutoDraw(True)
    
    # *Prac_2_15* updates
    if Prac_2_15.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Prac_2_15.frameNStart = frameN  # exact frame index
        Prac_2_15.tStart = t  # local t and not account for scr refresh
        Prac_2_15.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Prac_2_15, 'tStartRefresh')  # time at next scr refresh
        Prac_2_15.setAutoDraw(True)
    
    # *Prac_2_Resp6_2* updates
    if Prac_2_Resp6_2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Prac_2_Resp6_2.frameNStart = frameN  # exact frame index
        Prac_2_Resp6_2.tStart = t  # local t and not account for scr refresh
        Prac_2_Resp6_2.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Prac_2_Resp6_2, 'tStartRefresh')  # time at next scr refresh
        Prac_2_Resp6_2.setAutoDraw(True)
    
    # *Logo_4* updates
    if Logo_4.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Logo_4.frameNStart = frameN  # exact frame index
        Logo_4.tStart = t  # local t and not account for scr refresh
        Logo_4.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Logo_4, 'tStartRefresh')  # time at next scr refresh
        Logo_4.setAutoDraw(True)
    
    # *Next_Inst_3* updates
    if Next_Inst_3.status == NOT_STARTED and tThisFlip >= 2-frameTolerance:
        # keep track of start time/frame for later
        Next_Inst_3.frameNStart = frameN  # exact frame index
        Next_Inst_3.tStart = t  # local t and not account for scr refresh
        Next_Inst_3.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Next_Inst_3, 'tStartRefresh')  # time at next scr refresh
        Next_Inst_3.setAutoDraw(True)
    
    # check for quit (typically the Esc key)
    if endExpNow or defaultKeyboard.getKeys(keyList=["escape"]):
        core.quit()
    
    # check if all components have finished
    if not continueRoutine:  # a component has requested a forced-end of Routine
        break
    continueRoutine = False  # will revert to True if at least one component still running
    for thisComponent in Instruction4Components:
        if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
            continueRoutine = True
            break  # at least one component has not yet finished
    
    # refresh the screen
    if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
        win.flip()

# -------Ending Routine "Instruction4"-------
for thisComponent in Instruction4Components:
    if hasattr(thisComponent, "setAutoDraw"):
        thisComponent.setAutoDraw(False)
# store data for thisExp (ExperimentHandler)
x, y = mouse_Inst2_2.getPos()
buttons = mouse_Inst2_2.getPressed()
if sum(buttons):
    # check if the mouse was inside our 'clickable' objects
    gotValidClick = False
    try:
        iter(Next_Inst_3)
        clickableList = Next_Inst_3
    except:
        clickableList = [Next_Inst_3]
    for obj in clickableList:
        if obj.contains(mouse_Inst2_2):
            gotValidClick = True
            mouse_Inst2_2.clicked_name.append(obj.name)
thisExp.addData('mouse_Inst2_2.x', x)
thisExp.addData('mouse_Inst2_2.y', y)
thisExp.addData('mouse_Inst2_2.leftButton', buttons[0])
thisExp.addData('mouse_Inst2_2.midButton', buttons[1])
thisExp.addData('mouse_Inst2_2.rightButton', buttons[2])
if len(mouse_Inst2_2.clicked_name):
    thisExp.addData('mouse_Inst2_2.clicked_name', mouse_Inst2_2.clicked_name[0])
thisExp.addData('mouse_Inst2_2.started', mouse_Inst2_2.tStart)
thisExp.addData('mouse_Inst2_2.stopped', mouse_Inst2_2.tStop)
thisExp.nextEntry()
thisExp.addData('Prac1_4.started', Prac1_4.tStartRefresh)
thisExp.addData('Prac1_4.stopped', Prac1_4.tStopRefresh)
thisExp.addData('Instruction1_4.started', Instruction1_4.tStartRefresh)
thisExp.addData('Instruction1_4.stopped', Instruction1_4.tStopRefresh)
thisExp.addData('Prac_2.started', Prac_2.tStartRefresh)
thisExp.addData('Prac_2.stopped', Prac_2.tStopRefresh)
thisExp.addData('Prac_2_9.started', Prac_2_9.tStartRefresh)
thisExp.addData('Prac_2_9.stopped', Prac_2_9.tStopRefresh)
thisExp.addData('Prac_2_10.started', Prac_2_10.tStartRefresh)
thisExp.addData('Prac_2_10.stopped', Prac_2_10.tStopRefresh)
thisExp.addData('Prac_2_11.started', Prac_2_11.tStartRefresh)
thisExp.addData('Prac_2_11.stopped', Prac_2_11.tStopRefresh)
thisExp.addData('Prac_2_12.started', Prac_2_12.tStartRefresh)
thisExp.addData('Prac_2_12.stopped', Prac_2_12.tStopRefresh)
thisExp.addData('Prac_2_13.started', Prac_2_13.tStartRefresh)
thisExp.addData('Prac_2_13.stopped', Prac_2_13.tStopRefresh)
thisExp.addData('Prac_2_14.started', Prac_2_14.tStartRefresh)
thisExp.addData('Prac_2_14.stopped', Prac_2_14.tStopRefresh)
thisExp.addData('Prac_2_15.started', Prac_2_15.tStartRefresh)
thisExp.addData('Prac_2_15.stopped', Prac_2_15.tStopRefresh)
thisExp.addData('Prac_2_Resp6_2.started', Prac_2_Resp6_2.tStartRefresh)
thisExp.addData('Prac_2_Resp6_2.stopped', Prac_2_Resp6_2.tStopRefresh)
thisExp.addData('Logo_4.started', Logo_4.tStartRefresh)
thisExp.addData('Logo_4.stopped', Logo_4.tStopRefresh)
thisExp.addData('Next_Inst_3.started', Next_Inst_3.tStartRefresh)
thisExp.addData('Next_Inst_3.stopped', Next_Inst_3.tStopRefresh)
# the Routine "Instruction4" was not non-slip safe, so reset the non-slip timer
routineTimer.reset()

# ------Prepare to start Routine "Start"-------
continueRoutine = True
# update component parameters for each repeat
# setup some python lists for storing info about the mouse_start
mouse_start.clicked_name = []
gotValidClick = False  # until a click is received
# keep track of which components have finished
StartComponents = [Start_text, mouse_start, Start_Button, Logo_5]
for thisComponent in StartComponents:
    thisComponent.tStart = None
    thisComponent.tStop = None
    thisComponent.tStartRefresh = None
    thisComponent.tStopRefresh = None
    if hasattr(thisComponent, 'status'):
        thisComponent.status = NOT_STARTED
# reset timers
t = 0
_timeToFirstFrame = win.getFutureFlipTime(clock="now")
StartClock.reset(-_timeToFirstFrame)  # t0 is time of first possible flip
frameN = -1

# -------Run Routine "Start"-------
while continueRoutine:
    # get current time
    t = StartClock.getTime()
    tThisFlip = win.getFutureFlipTime(clock=StartClock)
    tThisFlipGlobal = win.getFutureFlipTime(clock=None)
    frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
    # update/draw components on each frame
    
    # *Start_text* updates
    if Start_text.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Start_text.frameNStart = frameN  # exact frame index
        Start_text.tStart = t  # local t and not account for scr refresh
        Start_text.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Start_text, 'tStartRefresh')  # time at next scr refresh
        Start_text.setAutoDraw(True)
    # *mouse_start* updates
    if mouse_start.status == NOT_STARTED and t >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        mouse_start.frameNStart = frameN  # exact frame index
        mouse_start.tStart = t  # local t and not account for scr refresh
        mouse_start.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(mouse_start, 'tStartRefresh')  # time at next scr refresh
        mouse_start.status = STARTED
        mouse_start.mouseClock.reset()
        prevButtonState = mouse_start.getPressed()  # if button is down already this ISN'T a new click
    if mouse_start.status == STARTED:  # only update if started and not finished!
        buttons = mouse_start.getPressed()
        if buttons != prevButtonState:  # button state changed?
            prevButtonState = buttons
            if sum(buttons) > 0:  # state changed to a new click
                # check if the mouse was inside our 'clickable' objects
                gotValidClick = False
                try:
                    iter(Start_Button)
                    clickableList = Start_Button
                except:
                    clickableList = [Start_Button]
                for obj in clickableList:
                    if obj.contains(mouse_start):
                        gotValidClick = True
                        mouse_start.clicked_name.append(obj.name)
                if gotValidClick:  
                    continueRoutine = False  # abort routine on response
    
    # *Start_Button* updates
    if Start_Button.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Start_Button.frameNStart = frameN  # exact frame index
        Start_Button.tStart = t  # local t and not account for scr refresh
        Start_Button.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Start_Button, 'tStartRefresh')  # time at next scr refresh
        Start_Button.setAutoDraw(True)
    
    # *Logo_5* updates
    if Logo_5.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Logo_5.frameNStart = frameN  # exact frame index
        Logo_5.tStart = t  # local t and not account for scr refresh
        Logo_5.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Logo_5, 'tStartRefresh')  # time at next scr refresh
        Logo_5.setAutoDraw(True)
    
    # check for quit (typically the Esc key)
    if endExpNow or defaultKeyboard.getKeys(keyList=["escape"]):
        core.quit()
    
    # check if all components have finished
    if not continueRoutine:  # a component has requested a forced-end of Routine
        break
    continueRoutine = False  # will revert to True if at least one component still running
    for thisComponent in StartComponents:
        if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
            continueRoutine = True
            break  # at least one component has not yet finished
    
    # refresh the screen
    if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
        win.flip()

# -------Ending Routine "Start"-------
for thisComponent in StartComponents:
    if hasattr(thisComponent, "setAutoDraw"):
        thisComponent.setAutoDraw(False)
thisExp.addData('Start_text.started', Start_text.tStartRefresh)
thisExp.addData('Start_text.stopped', Start_text.tStopRefresh)
# store data for thisExp (ExperimentHandler)
x, y = mouse_start.getPos()
buttons = mouse_start.getPressed()
if sum(buttons):
    # check if the mouse was inside our 'clickable' objects
    gotValidClick = False
    try:
        iter(Start_Button)
        clickableList = Start_Button
    except:
        clickableList = [Start_Button]
    for obj in clickableList:
        if obj.contains(mouse_start):
            gotValidClick = True
            mouse_start.clicked_name.append(obj.name)
thisExp.addData('mouse_start.x', x)
thisExp.addData('mouse_start.y', y)
thisExp.addData('mouse_start.leftButton', buttons[0])
thisExp.addData('mouse_start.midButton', buttons[1])
thisExp.addData('mouse_start.rightButton', buttons[2])
if len(mouse_start.clicked_name):
    thisExp.addData('mouse_start.clicked_name', mouse_start.clicked_name[0])
thisExp.addData('mouse_start.started', mouse_start.tStart)
thisExp.addData('mouse_start.stopped', mouse_start.tStop)
thisExp.nextEntry()
thisExp.addData('Start_Button.started', Start_Button.tStartRefresh)
thisExp.addData('Start_Button.stopped', Start_Button.tStopRefresh)
thisExp.addData('Logo_5.started', Logo_5.tStartRefresh)
thisExp.addData('Logo_5.stopped', Logo_5.tStopRefresh)
# the Routine "Start" was not non-slip safe, so reset the non-slip timer
routineTimer.reset()

# set up handler to look after randomisation of conditions etc
trials = data.TrialHandler(nReps=1, method='sequential', 
    extraInfo=expInfo, originPath=-1,
    trialList=data.importConditions('Items.xlsx'),
    seed=None, name='trials')
thisExp.addLoop(trials)  # add the loop to the experiment
thisTrial = trials.trialList[0]  # so we can initialise stimuli with some values
# abbreviate parameter names if possible (e.g. rgb = thisTrial.rgb)
if thisTrial != None:
    for paramName in thisTrial:
        exec('{} = thisTrial[paramName]'.format(paramName))

for thisTrial in trials:
    currentLoop = trials
    # abbreviate parameter names if possible (e.g. rgb = thisTrial.rgb)
    if thisTrial != None:
        for paramName in thisTrial:
            exec('{} = thisTrial[paramName]'.format(paramName))
    
    # ------Prepare to start Routine "ITI"-------
    continueRoutine = True
    routineTimer.add(0.500000)
    # update component parameters for each repeat
    # keep track of which components have finished
    ITIComponents = [White]
    for thisComponent in ITIComponents:
        thisComponent.tStart = None
        thisComponent.tStop = None
        thisComponent.tStartRefresh = None
        thisComponent.tStopRefresh = None
        if hasattr(thisComponent, 'status'):
            thisComponent.status = NOT_STARTED
    # reset timers
    t = 0
    _timeToFirstFrame = win.getFutureFlipTime(clock="now")
    ITIClock.reset(-_timeToFirstFrame)  # t0 is time of first possible flip
    frameN = -1
    
    # -------Run Routine "ITI"-------
    while continueRoutine and routineTimer.getTime() > 0:
        # get current time
        t = ITIClock.getTime()
        tThisFlip = win.getFutureFlipTime(clock=ITIClock)
        tThisFlipGlobal = win.getFutureFlipTime(clock=None)
        frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
        # update/draw components on each frame
        
        # *White* updates
        if White.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            White.frameNStart = frameN  # exact frame index
            White.tStart = t  # local t and not account for scr refresh
            White.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(White, 'tStartRefresh')  # time at next scr refresh
            White.setAutoDraw(True)
        if White.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > White.tStartRefresh + 0.5-frameTolerance:
                # keep track of stop time/frame for later
                White.tStop = t  # not accounting for scr refresh
                White.frameNStop = frameN  # exact frame index
                win.timeOnFlip(White, 'tStopRefresh')  # time at next scr refresh
                White.setAutoDraw(False)
        
        # check for quit (typically the Esc key)
        if endExpNow or defaultKeyboard.getKeys(keyList=["escape"]):
            core.quit()
        
        # check if all components have finished
        if not continueRoutine:  # a component has requested a forced-end of Routine
            break
        continueRoutine = False  # will revert to True if at least one component still running
        for thisComponent in ITIComponents:
            if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
                continueRoutine = True
                break  # at least one component has not yet finished
        
        # refresh the screen
        if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
            win.flip()
    
    # -------Ending Routine "ITI"-------
    for thisComponent in ITIComponents:
        if hasattr(thisComponent, "setAutoDraw"):
            thisComponent.setAutoDraw(False)
    trials.addData('White.started', White.tStartRefresh)
    trials.addData('White.stopped', White.tStopRefresh)
    
    # ------Prepare to start Routine "trial"-------
    continueRoutine = True
    # update component parameters for each repeat
    Probe.setImage(Test)
    # setup some python lists for storing info about the mouse_exp
    mouse_exp.x = []
    mouse_exp.y = []
    mouse_exp.leftButton = []
    mouse_exp.midButton = []
    mouse_exp.rightButton = []
    mouse_exp.time = []
    mouse_exp.clicked_name = []
    gotValidClick = False  # until a click is received
    mouse_exp.mouseClock.reset()
    Mat1.setImage(Sol1)
    Mat2.setImage(Sol2)
    Mat3.setImage(Sol3)
    Mat4.setImage(Sol4)
    Mat5.setImage(Sol5)
    Mat6.setImage(Sol6)
    Mat7.setImage(Sol7)
    Mat8.setImage(Sol8)
    Resp1.opacity=0
    Resp2.opacity=0
    Resp3.opacity=0
    Resp4.opacity=0
    Resp5.opacity=0
    Resp6.opacity=0
    Resp7.opacity=0
    Resp8.opacity=0
    # setup some python lists for storing info about the mouse_final
    mouse_final.clicked_name = []
    gotValidClick = False  # until a click is received
    # setup some python lists for storing info about the mouse_final_time
    mouse_final_time.clicked_name = []
    gotValidClick = False  # until a click is received
    # keep track of which components have finished
    trialComponents = [text_time, Probe, mouse_exp, Mat1, Mat2, Mat3, Mat4, Mat5, Mat6, Mat7, Mat8, Resp1, Resp2, Resp3, Resp4, Resp5, Resp6, Resp7, Resp8, mouse_final, mouse_final_time, Next, Times_up]
    for thisComponent in trialComponents:
        thisComponent.tStart = None
        thisComponent.tStop = None
        thisComponent.tStartRefresh = None
        thisComponent.tStopRefresh = None
        if hasattr(thisComponent, 'status'):
            thisComponent.status = NOT_STARTED
    # reset timers
    t = 0
    _timeToFirstFrame = win.getFutureFlipTime(clock="now")
    trialClock.reset(-_timeToFirstFrame)  # t0 is time of first possible flip
    frameN = -1
    
    # -------Run Routine "trial"-------
    while continueRoutine:
        # get current time
        t = trialClock.getTime()
        tThisFlip = win.getFutureFlipTime(clock=trialClock)
        tThisFlipGlobal = win.getFutureFlipTime(clock=None)
        frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
        # update/draw components on each frame
        
        # *text_time* updates
        if text_time.status == NOT_STARTED and tThisFlip >= 120-frameTolerance:
            # keep track of start time/frame for later
            text_time.frameNStart = frameN  # exact frame index
            text_time.tStart = t  # local t and not account for scr refresh
            text_time.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(text_time, 'tStartRefresh')  # time at next scr refresh
            text_time.setAutoDraw(True)
        if text_time.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > text_time.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                text_time.tStop = t  # not accounting for scr refresh
                text_time.frameNStop = frameN  # exact frame index
                win.timeOnFlip(text_time, 'tStopRefresh')  # time at next scr refresh
                text_time.setAutoDraw(False)
        
        # *Probe* updates
        if Probe.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            Probe.frameNStart = frameN  # exact frame index
            Probe.tStart = t  # local t and not account for scr refresh
            Probe.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(Probe, 'tStartRefresh')  # time at next scr refresh
            Probe.setAutoDraw(True)
        if Probe.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > Probe.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                Probe.tStop = t  # not accounting for scr refresh
                Probe.frameNStop = frameN  # exact frame index
                win.timeOnFlip(Probe, 'tStopRefresh')  # time at next scr refresh
                Probe.setAutoDraw(False)
        # *mouse_exp* updates
        if mouse_exp.status == NOT_STARTED and t >= 0.1-frameTolerance:
            # keep track of start time/frame for later
            mouse_exp.frameNStart = frameN  # exact frame index
            mouse_exp.tStart = t  # local t and not account for scr refresh
            mouse_exp.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(mouse_exp, 'tStartRefresh')  # time at next scr refresh
            mouse_exp.status = STARTED
            prevButtonState = mouse_exp.getPressed()  # if button is down already this ISN'T a new click
        if mouse_exp.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > mouse_exp.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                mouse_exp.tStop = t  # not accounting for scr refresh
                mouse_exp.frameNStop = frameN  # exact frame index
                win.timeOnFlip(mouse_exp, 'tStopRefresh')  # time at next scr refresh
                mouse_exp.status = FINISHED
        if mouse_exp.status == STARTED:  # only update if started and not finished!
            buttons = mouse_exp.getPressed()
            if buttons != prevButtonState:  # button state changed?
                prevButtonState = buttons
                if sum(buttons) > 0:  # state changed to a new click
                    # check if the mouse was inside our 'clickable' objects
                    gotValidClick = False
                    try:
                        iter([Mat1, Mat2, Mat3, Mat4, Mat5, Mat6, Mat7, Mat8])
                        clickableList = [Mat1, Mat2, Mat3, Mat4, Mat5, Mat6, Mat7, Mat8]
                    except:
                        clickableList = [[Mat1, Mat2, Mat3, Mat4, Mat5, Mat6, Mat7, Mat8]]
                    for obj in clickableList:
                        if obj.contains(mouse_exp):
                            gotValidClick = True
                            mouse_exp.clicked_name.append(obj.name)
                    x, y = mouse_exp.getPos()
                    mouse_exp.x.append(x)
                    mouse_exp.y.append(y)
                    buttons = mouse_exp.getPressed()
                    mouse_exp.leftButton.append(buttons[0])
                    mouse_exp.midButton.append(buttons[1])
                    mouse_exp.rightButton.append(buttons[2])
                    mouse_exp.time.append(mouse_exp.mouseClock.getTime())
        
        # *Mat1* updates
        if Mat1.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            Mat1.frameNStart = frameN  # exact frame index
            Mat1.tStart = t  # local t and not account for scr refresh
            Mat1.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(Mat1, 'tStartRefresh')  # time at next scr refresh
            Mat1.setAutoDraw(True)
        if Mat1.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > Mat1.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                Mat1.tStop = t  # not accounting for scr refresh
                Mat1.frameNStop = frameN  # exact frame index
                win.timeOnFlip(Mat1, 'tStopRefresh')  # time at next scr refresh
                Mat1.setAutoDraw(False)
        
        # *Mat2* updates
        if Mat2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            Mat2.frameNStart = frameN  # exact frame index
            Mat2.tStart = t  # local t and not account for scr refresh
            Mat2.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(Mat2, 'tStartRefresh')  # time at next scr refresh
            Mat2.setAutoDraw(True)
        if Mat2.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > Mat2.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                Mat2.tStop = t  # not accounting for scr refresh
                Mat2.frameNStop = frameN  # exact frame index
                win.timeOnFlip(Mat2, 'tStopRefresh')  # time at next scr refresh
                Mat2.setAutoDraw(False)
        
        # *Mat3* updates
        if Mat3.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            Mat3.frameNStart = frameN  # exact frame index
            Mat3.tStart = t  # local t and not account for scr refresh
            Mat3.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(Mat3, 'tStartRefresh')  # time at next scr refresh
            Mat3.setAutoDraw(True)
        if Mat3.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > Mat3.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                Mat3.tStop = t  # not accounting for scr refresh
                Mat3.frameNStop = frameN  # exact frame index
                win.timeOnFlip(Mat3, 'tStopRefresh')  # time at next scr refresh
                Mat3.setAutoDraw(False)
        
        # *Mat4* updates
        if Mat4.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            Mat4.frameNStart = frameN  # exact frame index
            Mat4.tStart = t  # local t and not account for scr refresh
            Mat4.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(Mat4, 'tStartRefresh')  # time at next scr refresh
            Mat4.setAutoDraw(True)
        if Mat4.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > Mat4.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                Mat4.tStop = t  # not accounting for scr refresh
                Mat4.frameNStop = frameN  # exact frame index
                win.timeOnFlip(Mat4, 'tStopRefresh')  # time at next scr refresh
                Mat4.setAutoDraw(False)
        
        # *Mat5* updates
        if Mat5.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            Mat5.frameNStart = frameN  # exact frame index
            Mat5.tStart = t  # local t and not account for scr refresh
            Mat5.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(Mat5, 'tStartRefresh')  # time at next scr refresh
            Mat5.setAutoDraw(True)
        if Mat5.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > Mat5.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                Mat5.tStop = t  # not accounting for scr refresh
                Mat5.frameNStop = frameN  # exact frame index
                win.timeOnFlip(Mat5, 'tStopRefresh')  # time at next scr refresh
                Mat5.setAutoDraw(False)
        
        # *Mat6* updates
        if Mat6.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            Mat6.frameNStart = frameN  # exact frame index
            Mat6.tStart = t  # local t and not account for scr refresh
            Mat6.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(Mat6, 'tStartRefresh')  # time at next scr refresh
            Mat6.setAutoDraw(True)
        if Mat6.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > Mat6.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                Mat6.tStop = t  # not accounting for scr refresh
                Mat6.frameNStop = frameN  # exact frame index
                win.timeOnFlip(Mat6, 'tStopRefresh')  # time at next scr refresh
                Mat6.setAutoDraw(False)
        
        # *Mat7* updates
        if Mat7.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            Mat7.frameNStart = frameN  # exact frame index
            Mat7.tStart = t  # local t and not account for scr refresh
            Mat7.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(Mat7, 'tStartRefresh')  # time at next scr refresh
            Mat7.setAutoDraw(True)
        if Mat7.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > Mat7.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                Mat7.tStop = t  # not accounting for scr refresh
                Mat7.frameNStop = frameN  # exact frame index
                win.timeOnFlip(Mat7, 'tStopRefresh')  # time at next scr refresh
                Mat7.setAutoDraw(False)
        
        # *Mat8* updates
        if Mat8.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            Mat8.frameNStart = frameN  # exact frame index
            Mat8.tStart = t  # local t and not account for scr refresh
            Mat8.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(Mat8, 'tStartRefresh')  # time at next scr refresh
            Mat8.setAutoDraw(True)
        if Mat8.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > Mat8.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                Mat8.tStop = t  # not accounting for scr refresh
                Mat8.frameNStop = frameN  # exact frame index
                win.timeOnFlip(Mat8, 'tStopRefresh')  # time at next scr refresh
                Mat8.setAutoDraw(False)
        
        # *Resp1* updates
        if Resp1.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            Resp1.frameNStart = frameN  # exact frame index
            Resp1.tStart = t  # local t and not account for scr refresh
            Resp1.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(Resp1, 'tStartRefresh')  # time at next scr refresh
            Resp1.setAutoDraw(True)
        if Resp1.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > Resp1.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                Resp1.tStop = t  # not accounting for scr refresh
                Resp1.frameNStop = frameN  # exact frame index
                win.timeOnFlip(Resp1, 'tStopRefresh')  # time at next scr refresh
                Resp1.setAutoDraw(False)
        
        # *Resp2* updates
        if Resp2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            Resp2.frameNStart = frameN  # exact frame index
            Resp2.tStart = t  # local t and not account for scr refresh
            Resp2.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(Resp2, 'tStartRefresh')  # time at next scr refresh
            Resp2.setAutoDraw(True)
        if Resp2.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > Resp2.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                Resp2.tStop = t  # not accounting for scr refresh
                Resp2.frameNStop = frameN  # exact frame index
                win.timeOnFlip(Resp2, 'tStopRefresh')  # time at next scr refresh
                Resp2.setAutoDraw(False)
        
        # *Resp3* updates
        if Resp3.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            Resp3.frameNStart = frameN  # exact frame index
            Resp3.tStart = t  # local t and not account for scr refresh
            Resp3.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(Resp3, 'tStartRefresh')  # time at next scr refresh
            Resp3.setAutoDraw(True)
        if Resp3.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > Resp3.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                Resp3.tStop = t  # not accounting for scr refresh
                Resp3.frameNStop = frameN  # exact frame index
                win.timeOnFlip(Resp3, 'tStopRefresh')  # time at next scr refresh
                Resp3.setAutoDraw(False)
        
        # *Resp4* updates
        if Resp4.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            Resp4.frameNStart = frameN  # exact frame index
            Resp4.tStart = t  # local t and not account for scr refresh
            Resp4.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(Resp4, 'tStartRefresh')  # time at next scr refresh
            Resp4.setAutoDraw(True)
        if Resp4.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > Resp4.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                Resp4.tStop = t  # not accounting for scr refresh
                Resp4.frameNStop = frameN  # exact frame index
                win.timeOnFlip(Resp4, 'tStopRefresh')  # time at next scr refresh
                Resp4.setAutoDraw(False)
        
        # *Resp5* updates
        if Resp5.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            Resp5.frameNStart = frameN  # exact frame index
            Resp5.tStart = t  # local t and not account for scr refresh
            Resp5.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(Resp5, 'tStartRefresh')  # time at next scr refresh
            Resp5.setAutoDraw(True)
        if Resp5.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > Resp5.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                Resp5.tStop = t  # not accounting for scr refresh
                Resp5.frameNStop = frameN  # exact frame index
                win.timeOnFlip(Resp5, 'tStopRefresh')  # time at next scr refresh
                Resp5.setAutoDraw(False)
        
        # *Resp6* updates
        if Resp6.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            Resp6.frameNStart = frameN  # exact frame index
            Resp6.tStart = t  # local t and not account for scr refresh
            Resp6.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(Resp6, 'tStartRefresh')  # time at next scr refresh
            Resp6.setAutoDraw(True)
        if Resp6.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > Resp6.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                Resp6.tStop = t  # not accounting for scr refresh
                Resp6.frameNStop = frameN  # exact frame index
                win.timeOnFlip(Resp6, 'tStopRefresh')  # time at next scr refresh
                Resp6.setAutoDraw(False)
        
        # *Resp7* updates
        if Resp7.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            Resp7.frameNStart = frameN  # exact frame index
            Resp7.tStart = t  # local t and not account for scr refresh
            Resp7.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(Resp7, 'tStartRefresh')  # time at next scr refresh
            Resp7.setAutoDraw(True)
        if Resp7.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > Resp7.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                Resp7.tStop = t  # not accounting for scr refresh
                Resp7.frameNStop = frameN  # exact frame index
                win.timeOnFlip(Resp7, 'tStopRefresh')  # time at next scr refresh
                Resp7.setAutoDraw(False)
        
        # *Resp8* updates
        if Resp8.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            Resp8.frameNStart = frameN  # exact frame index
            Resp8.tStart = t  # local t and not account for scr refresh
            Resp8.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(Resp8, 'tStartRefresh')  # time at next scr refresh
            Resp8.setAutoDraw(True)
        if Resp8.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > Resp8.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                Resp8.tStop = t  # not accounting for scr refresh
                Resp8.frameNStop = frameN  # exact frame index
                win.timeOnFlip(Resp8, 'tStopRefresh')  # time at next scr refresh
                Resp8.setAutoDraw(False)
        if len(mouse_exp.clicked_name)>0:
         if mouse_exp.isPressedIn(Mat1):
            Resp1.opacity=1
            Resp2.opacity=0
            Resp3.opacity=0
            Resp4.opacity=0
            Resp5.opacity=0
            Resp6.opacity=0
            Resp7.opacity=0
            Resp8.opacity=0
         elif mouse_exp.isPressedIn(Mat2):
            Resp1.opacity=0
            Resp2.opacity=1
            Resp3.opacity=0
            Resp4.opacity=0
            Resp5.opacity=0
            Resp6.opacity=0
            Resp7.opacity=0
            Resp8.opacity=0
         elif mouse_exp.isPressedIn(Mat3):
            Resp1.opacity=0
            Resp2.opacity=0
            Resp3.opacity=1
            Resp4.opacity=0
            Resp5.opacity=0
            Resp6.opacity=0
            Resp7.opacity=0
            Resp8.opacity=0
         elif mouse_exp.isPressedIn(Mat4):
            Resp1.opacity=0
            Resp2.opacity=0
            Resp3.opacity=0
            Resp4.opacity=1
            Resp5.opacity=0
            Resp6.opacity=0
            Resp7.opacity=0
            Resp8.opacity=0
         elif mouse_exp.isPressedIn(Mat5):
            Resp1.opacity=0
            Resp2.opacity=0
            Resp3.opacity=0
            Resp4.opacity=0
            Resp5.opacity=1
            Resp6.opacity=0
            Resp7.opacity=0
            Resp8.opacity=0
         elif mouse_exp.isPressedIn(Mat6):
            Resp1.opacity=0
            Resp2.opacity=0
            Resp3.opacity=0
            Resp4.opacity=0
            Resp5.opacity=0
            Resp6.opacity=1
            Resp7.opacity=0
            Resp8.opacity=0
         elif mouse_exp.isPressedIn(Mat7):
            Resp1.opacity=0
            Resp2.opacity=0
            Resp3.opacity=0
            Resp4.opacity=0
            Resp5.opacity=0
            Resp6.opacity=0
            Resp7.opacity=1
            Resp8.opacity=0
         elif mouse_exp.isPressedIn(Mat8):
            Resp1.opacity=0
            Resp2.opacity=0
            Resp3.opacity=0
            Resp4.opacity=0
            Resp5.opacity=0
            Resp6.opacity=0
            Resp7.opacity=0
            Resp8.opacity=1
        if len(mouse_exp.clicked_name)>0 and mouse_final.isPressedIn(Next):
            continueRoutine = False
        
        if mouse_final.isPressedIn(Times_up):
            continueRoutine = False
        
        # *mouse_final* updates
        if mouse_final.status == NOT_STARTED and len(mouse_exp.clicked_name)>0:
            # keep track of start time/frame for later
            mouse_final.frameNStart = frameN  # exact frame index
            mouse_final.tStart = t  # local t and not account for scr refresh
            mouse_final.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(mouse_final, 'tStartRefresh')  # time at next scr refresh
            mouse_final.status = STARTED
            mouse_final.mouseClock.reset()
            prevButtonState = mouse_final.getPressed()  # if button is down already this ISN'T a new click
        if mouse_final.status == STARTED:  # only update if started and not finished!
            buttons = mouse_final.getPressed()
            if buttons != prevButtonState:  # button state changed?
                prevButtonState = buttons
                if sum(buttons) > 0:  # state changed to a new click
                    # check if the mouse was inside our 'clickable' objects
                    gotValidClick = False
                    try:
                        iter(Next)
                        clickableList = Next
                    except:
                        clickableList = [Next]
                    for obj in clickableList:
                        if obj.contains(mouse_final):
                            gotValidClick = True
                            mouse_final.clicked_name.append(obj.name)
                    if gotValidClick:  
                        continueRoutine = False  # abort routine on response
        # *mouse_final_time* updates
        if mouse_final_time.status == NOT_STARTED and t==120:
            # keep track of start time/frame for later
            mouse_final_time.frameNStart = frameN  # exact frame index
            mouse_final_time.tStart = t  # local t and not account for scr refresh
            mouse_final_time.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(mouse_final_time, 'tStartRefresh')  # time at next scr refresh
            mouse_final_time.status = STARTED
            mouse_final_time.mouseClock.reset()
            prevButtonState = mouse_final_time.getPressed()  # if button is down already this ISN'T a new click
        if mouse_final_time.status == STARTED:  # only update if started and not finished!
            buttons = mouse_final_time.getPressed()
            if buttons != prevButtonState:  # button state changed?
                prevButtonState = buttons
                if sum(buttons) > 0:  # state changed to a new click
                    # check if the mouse was inside our 'clickable' objects
                    gotValidClick = False
                    try:
                        iter(Times_up)
                        clickableList = Times_up
                    except:
                        clickableList = [Times_up]
                    for obj in clickableList:
                        if obj.contains(mouse_final_time):
                            gotValidClick = True
                            mouse_final_time.clicked_name.append(obj.name)
                    if gotValidClick:  
                        continueRoutine = False  # abort routine on response
        
        # *Next* updates
        if Next.status == NOT_STARTED and len(mouse_exp.clicked_name) :
            # keep track of start time/frame for later
            Next.frameNStart = frameN  # exact frame index
            Next.tStart = t  # local t and not account for scr refresh
            Next.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(Next, 'tStartRefresh')  # time at next scr refresh
            Next.setAutoDraw(True)
        if Next.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > Next.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                Next.tStop = t  # not accounting for scr refresh
                Next.frameNStop = frameN  # exact frame index
                win.timeOnFlip(Next, 'tStopRefresh')  # time at next scr refresh
                Next.setAutoDraw(False)
        
        # *Times_up* updates
        if Times_up.status == NOT_STARTED and tThisFlip >= 120-frameTolerance:
            # keep track of start time/frame for later
            Times_up.frameNStart = frameN  # exact frame index
            Times_up.tStart = t  # local t and not account for scr refresh
            Times_up.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(Times_up, 'tStartRefresh')  # time at next scr refresh
            Times_up.setAutoDraw(True)
        
        # check for quit (typically the Esc key)
        if endExpNow or defaultKeyboard.getKeys(keyList=["escape"]):
            core.quit()
        
        # check if all components have finished
        if not continueRoutine:  # a component has requested a forced-end of Routine
            break
        continueRoutine = False  # will revert to True if at least one component still running
        for thisComponent in trialComponents:
            if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
                continueRoutine = True
                break  # at least one component has not yet finished
        
        # refresh the screen
        if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
            win.flip()
    
    # -------Ending Routine "trial"-------
    for thisComponent in trialComponents:
        if hasattr(thisComponent, "setAutoDraw"):
            thisComponent.setAutoDraw(False)
    trials.addData('text_time.started', text_time.tStartRefresh)
    trials.addData('text_time.stopped', text_time.tStopRefresh)
    trials.addData('Probe.started', Probe.tStartRefresh)
    trials.addData('Probe.stopped', Probe.tStopRefresh)
    # store data for trials (TrialHandler)
    trials.addData('mouse_exp.x', mouse_exp.x)
    trials.addData('mouse_exp.y', mouse_exp.y)
    trials.addData('mouse_exp.leftButton', mouse_exp.leftButton)
    trials.addData('mouse_exp.midButton', mouse_exp.midButton)
    trials.addData('mouse_exp.rightButton', mouse_exp.rightButton)
    trials.addData('mouse_exp.time', mouse_exp.time)
    trials.addData('mouse_exp.clicked_name', mouse_exp.clicked_name)
    trials.addData('mouse_exp.started', mouse_exp.tStart)
    trials.addData('mouse_exp.stopped', mouse_exp.tStop)
    trials.addData('Mat1.started', Mat1.tStartRefresh)
    trials.addData('Mat1.stopped', Mat1.tStopRefresh)
    trials.addData('Mat2.started', Mat2.tStartRefresh)
    trials.addData('Mat2.stopped', Mat2.tStopRefresh)
    trials.addData('Mat3.started', Mat3.tStartRefresh)
    trials.addData('Mat3.stopped', Mat3.tStopRefresh)
    trials.addData('Mat4.started', Mat4.tStartRefresh)
    trials.addData('Mat4.stopped', Mat4.tStopRefresh)
    trials.addData('Mat5.started', Mat5.tStartRefresh)
    trials.addData('Mat5.stopped', Mat5.tStopRefresh)
    trials.addData('Mat6.started', Mat6.tStartRefresh)
    trials.addData('Mat6.stopped', Mat6.tStopRefresh)
    trials.addData('Mat7.started', Mat7.tStartRefresh)
    trials.addData('Mat7.stopped', Mat7.tStopRefresh)
    trials.addData('Mat8.started', Mat8.tStartRefresh)
    trials.addData('Mat8.stopped', Mat8.tStopRefresh)
    trials.addData('Resp1.started', Resp1.tStartRefresh)
    trials.addData('Resp1.stopped', Resp1.tStopRefresh)
    trials.addData('Resp2.started', Resp2.tStartRefresh)
    trials.addData('Resp2.stopped', Resp2.tStopRefresh)
    trials.addData('Resp3.started', Resp3.tStartRefresh)
    trials.addData('Resp3.stopped', Resp3.tStopRefresh)
    trials.addData('Resp4.started', Resp4.tStartRefresh)
    trials.addData('Resp4.stopped', Resp4.tStopRefresh)
    trials.addData('Resp5.started', Resp5.tStartRefresh)
    trials.addData('Resp5.stopped', Resp5.tStopRefresh)
    trials.addData('Resp6.started', Resp6.tStartRefresh)
    trials.addData('Resp6.stopped', Resp6.tStopRefresh)
    trials.addData('Resp7.started', Resp7.tStartRefresh)
    trials.addData('Resp7.stopped', Resp7.tStopRefresh)
    trials.addData('Resp8.started', Resp8.tStartRefresh)
    trials.addData('Resp8.stopped', Resp8.tStopRefresh)
    # store data for trials (TrialHandler)
    x, y = mouse_final.getPos()
    buttons = mouse_final.getPressed()
    if sum(buttons):
        # check if the mouse was inside our 'clickable' objects
        gotValidClick = False
        try:
            iter(Next)
            clickableList = Next
        except:
            clickableList = [Next]
        for obj in clickableList:
            if obj.contains(mouse_final):
                gotValidClick = True
                mouse_final.clicked_name.append(obj.name)
    trials.addData('mouse_final.x', x)
    trials.addData('mouse_final.y', y)
    trials.addData('mouse_final.leftButton', buttons[0])
    trials.addData('mouse_final.midButton', buttons[1])
    trials.addData('mouse_final.rightButton', buttons[2])
    if len(mouse_final.clicked_name):
        trials.addData('mouse_final.clicked_name', mouse_final.clicked_name[0])
    trials.addData('mouse_final.started', mouse_final.tStart)
    trials.addData('mouse_final.stopped', mouse_final.tStop)
    # store data for trials (TrialHandler)
    x, y = mouse_final_time.getPos()
    buttons = mouse_final_time.getPressed()
    if sum(buttons):
        # check if the mouse was inside our 'clickable' objects
        gotValidClick = False
        try:
            iter(Times_up)
            clickableList = Times_up
        except:
            clickableList = [Times_up]
        for obj in clickableList:
            if obj.contains(mouse_final_time):
                gotValidClick = True
                mouse_final_time.clicked_name.append(obj.name)
    trials.addData('mouse_final_time.x', x)
    trials.addData('mouse_final_time.y', y)
    trials.addData('mouse_final_time.leftButton', buttons[0])
    trials.addData('mouse_final_time.midButton', buttons[1])
    trials.addData('mouse_final_time.rightButton', buttons[2])
    if len(mouse_final_time.clicked_name):
        trials.addData('mouse_final_time.clicked_name', mouse_final_time.clicked_name[0])
    trials.addData('mouse_final_time.started', mouse_final_time.tStart)
    trials.addData('mouse_final_time.stopped', mouse_final_time.tStop)
    if len(mouse_exp.clicked_name)>0 or t == 120:
     if mouse_exp.clicked_name[-1] == CorResp:
        thisExp.addData('correct', '1') 
     else:
       thisExp.addData('correct', '0')
    trials.addData('Next.started', Next.tStartRefresh)
    trials.addData('Next.stopped', Next.tStopRefresh)
    trials.addData('Times_up.started', Times_up.tStartRefresh)
    trials.addData('Times_up.stopped', Times_up.tStopRefresh)
    # the Routine "trial" was not non-slip safe, so reset the non-slip timer
    routineTimer.reset()
    thisExp.nextEntry()
    
# completed 1 repeats of 'trials'


# ------Prepare to start Routine "End_Screen"-------
continueRoutine = True
# update component parameters for each repeat
key_resp.keys = []
key_resp.rt = []
_key_resp_allKeys = []
# keep track of which components have finished
End_ScreenComponents = [End, Logo_End, key_resp]
for thisComponent in End_ScreenComponents:
    thisComponent.tStart = None
    thisComponent.tStop = None
    thisComponent.tStartRefresh = None
    thisComponent.tStopRefresh = None
    if hasattr(thisComponent, 'status'):
        thisComponent.status = NOT_STARTED
# reset timers
t = 0
_timeToFirstFrame = win.getFutureFlipTime(clock="now")
End_ScreenClock.reset(-_timeToFirstFrame)  # t0 is time of first possible flip
frameN = -1

# -------Run Routine "End_Screen"-------
while continueRoutine:
    # get current time
    t = End_ScreenClock.getTime()
    tThisFlip = win.getFutureFlipTime(clock=End_ScreenClock)
    tThisFlipGlobal = win.getFutureFlipTime(clock=None)
    frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
    # update/draw components on each frame
    
    # *End* updates
    if End.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        End.frameNStart = frameN  # exact frame index
        End.tStart = t  # local t and not account for scr refresh
        End.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(End, 'tStartRefresh')  # time at next scr refresh
        End.setAutoDraw(True)
    
    # *Logo_End* updates
    if Logo_End.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        Logo_End.frameNStart = frameN  # exact frame index
        Logo_End.tStart = t  # local t and not account for scr refresh
        Logo_End.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(Logo_End, 'tStartRefresh')  # time at next scr refresh
        Logo_End.setAutoDraw(True)
    
    # *key_resp* updates
    waitOnFlip = False
    if key_resp.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        key_resp.frameNStart = frameN  # exact frame index
        key_resp.tStart = t  # local t and not account for scr refresh
        key_resp.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(key_resp, 'tStartRefresh')  # time at next scr refresh
        key_resp.status = STARTED
        # keyboard checking is just starting
        waitOnFlip = True
        win.callOnFlip(key_resp.clock.reset)  # t=0 on next screen flip
        win.callOnFlip(key_resp.clearEvents, eventType='keyboard')  # clear events on next screen flip
    if key_resp.status == STARTED and not waitOnFlip:
        theseKeys = key_resp.getKeys(keyList=['space'], waitRelease=False)
        _key_resp_allKeys.extend(theseKeys)
        if len(_key_resp_allKeys):
            key_resp.keys = _key_resp_allKeys[-1].name  # just the last key pressed
            key_resp.rt = _key_resp_allKeys[-1].rt
            # a response ends the routine
            continueRoutine = False
    
    # check for quit (typically the Esc key)
    if endExpNow or defaultKeyboard.getKeys(keyList=["escape"]):
        core.quit()
    
    # check if all components have finished
    if not continueRoutine:  # a component has requested a forced-end of Routine
        break
    continueRoutine = False  # will revert to True if at least one component still running
    for thisComponent in End_ScreenComponents:
        if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
            continueRoutine = True
            break  # at least one component has not yet finished
    
    # refresh the screen
    if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
        win.flip()

# -------Ending Routine "End_Screen"-------
for thisComponent in End_ScreenComponents:
    if hasattr(thisComponent, "setAutoDraw"):
        thisComponent.setAutoDraw(False)
thisExp.addData('End.started', End.tStartRefresh)
thisExp.addData('End.stopped', End.tStopRefresh)
thisExp.addData('Logo_End.started', Logo_End.tStartRefresh)
thisExp.addData('Logo_End.stopped', Logo_End.tStopRefresh)
# check responses
if key_resp.keys in ['', [], None]:  # No response was made
    key_resp.keys = None
thisExp.addData('key_resp.keys',key_resp.keys)
if key_resp.keys != None:  # we had a response
    thisExp.addData('key_resp.rt', key_resp.rt)
thisExp.addData('key_resp.started', key_resp.tStartRefresh)
thisExp.addData('key_resp.stopped', key_resp.tStopRefresh)
thisExp.nextEntry()
# the Routine "End_Screen" was not non-slip safe, so reset the non-slip timer
routineTimer.reset()

# Flip one final time so any remaining win.callOnFlip() 
# and win.timeOnFlip() tasks get executed before quitting
win.flip()

# these shouldn't be strictly necessary (should auto-save)
thisExp.saveAsWideText(filename+'.csv', delim='auto')
thisExp.saveAsPickle(filename)
logging.flush()
# make sure everything is closed down
if eyetracker:
    eyetracker.setConnectionState(False)
thisExp.abort()  # or data files will save again on exit
win.close()
core.quit()
