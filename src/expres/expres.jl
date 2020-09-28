"""
   Delegates loading functions & traits for the EXPRES spectrograph
Author: Eric Ford and collaborators
Created: August 2020
"""

"""
Module providing types and traits and customized functions for the EXPRES Spectrograph.
    http://exoplanets.astro.yale.edu/expresBlog/
    https://ui.adsabs.harvard.edu/abs/2016SPIE.9908E..6TJ/abstract
"""
module EXPRES
using RvSpectMLBase
import RvSpectMLBase: AbstractInstrument, AbstractInstrument1D, AbstractInstrument2D
import ..EchelleInstruments: read_manifest, read_metadata_from_fits
#import ..EchelleInstruments: read_header

using DataFrames, Query, FITSIO
using Dates  # If need to use datetime2julian() to get jd.  Need to check about getting BJD.

""" Trait for 1D Extracted spectra from EXPRES """
struct EXPRES1D <: AbstractInstrument1D end

""" Trait for 2D Extracted spectra from EXPRES """
struct EXPRES2D <: AbstractInstrument2D end

"Trait to specify any 1D or 2D Extracted spectra from NEID "
const AnyEXPRES = Union{EXPRES1D,EXPRES2D}

export EXPRES1D, EXPRES2D, AnyEXPRES

include("traits.jl")
export min_order, max_order, min_pixel_in_order, max_pixel_in_order
export orders_to_use_default, min_col_default, max_col_default
export metadata_symbols_default, metadata_strings_default
export default_ccf_mask_v_width
export get_inst_module

include("io.jl")
#export read_data
# export make_manifest
# read_header not exported to avoid conflict with FITSIO.read_header

#import RvSpectMLBase: filter_line_list, find_worst_telluric_in_each_chunk
include("util.jl")
export continuum_normalize_spectrum!, continuum_normalize_spectra!
export filter_line_list, find_worst_telluric_in_each_chunk

end
