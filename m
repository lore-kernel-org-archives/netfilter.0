From: Psyspy 22 <psyspy2020@gmail.com>
Subject: libnetfilter_conntrack: ABI breakage error
Date: Fri, 21 May 2021 11:55:11 -0600
Message-ID: <CAFqmWq9r95YtvNc+eYwHcL+oDutgL+g++tPZBsr9yh2KrNveNw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=STaTFzg0DRvcJZAuOCmYKe63DPc86fr2D4M4kIidV08=;
        b=BVbf1Bt+IALlztXce87pgxPrkMX5Y/EMblXWK3zlrex1KzkBYhXAYV1ugpJRTv187h
         WxUd8auM0tY0QCZ0K290Hb7+lfmjTX3/SQoBofdDmIdi6kF8ntmrG9EGNrtZjX6xr/tU
         YAgCUvX0kSJIEqVp0D7PSLMHlpR+omo7/mESWZxOANs5g+uF5WOX4+wv70WGzgl2oME9
         C9pmIzJ4xG4IripReRNCPFOtRlHpdsDaDQjFDiHz5SUiEfA8QUtC3MGnlBIrytIxCofS
         amupBhJIc9vcH90wLpQkJL+KPiuPISMk3RgEQwj4/136uT4MxgFJWxXV4JJ7yLZggBl6
         +Xzw==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I am trying to dump conntrack entries from my application. When I run
the binary, it throws the following error and exits:

# ./dump
ctnetlink kernel ABI is broken, contact your vendor.
../../source_subfolder/src/conntrack/parse_mnl.c:824 reason: Numerical
result out of range

I looked at the source code of the library, it seems to be this line:

case CTA_SYNPROXY_TSOFF:
           if (mnl_attr_validate(attr, MNL_TYPE_U32) < 0)
               abi_breakage();
           break;
       }

I am not sure why this issue occurs or how to fix it. I appreciate any help!

Kind Regards!
