module Paths_harmlang (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,0,1], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/louisrassaby/Library/Haskell/bin"
libdir     = "/Users/louisrassaby/Library/Haskell/ghc-7.8.3-x86_64/lib/harmlang-0.1.0.1"
datadir    = "/Users/louisrassaby/Library/Haskell/share/ghc-7.8.3-x86_64/harmlang-0.1.0.1"
libexecdir = "/Users/louisrassaby/Library/Haskell/libexec"
sysconfdir = "/Users/louisrassaby/Library/Haskell/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "harmlang_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "harmlang_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "harmlang_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "harmlang_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "harmlang_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
