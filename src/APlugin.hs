module APlugin (plugin) where

import GHC.Plugins hiding (Expr, Let, empty)
import Debug.Trace

plugin :: Plugin
plugin = defaultPlugin
  { parsedResultAction = replaceBangs
  }
replaceBangs :: [CommandLineOption] -> ModSummary -> ParsedResult -> Hsc ParsedResult
replaceBangs _ _ res =
  trace "Plugin is running...\n" (pure $ res)
