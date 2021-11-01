From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: nft named set address types
Date: Mon, 1 Nov 2021 15:46:13 -0500
Message-ID: <CAOLfK3UFmzPfaqZbB5z6kvRuvpmHrFptbf1_LLBfJdPPzVHwqQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 4HjlSK1ZqNz9vLH3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=d.umn.edu; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=I9b/NIDZaH73H6jQdmSkCjTUFOfrY3U8b8eK5Q56scU=;
        b=fYiegIdXkoyIG36CIglgBXqrkQvpNYbtud1Ctsxp11gOTXrnLyYuvqknK5ugrcukWQ
         qIY1bUhhGNYZCxR6HRmGiaq57mZ74soGZcE92HVp0OFOkZehnzD0Z/vYwQ7cbnu0TGE5
         tSkpjxFJxXE9Wlo0SJnN/Mxjy+wAkPS+7W003eDdEFOL1QvZVZ5Q76+J2dX/0Pru6cSd
         gMWRrlBTfHDaTkYB/lZ67h+F6kEUz0Gvb7v+jAj5cAAXQS+iO/pNmT385ss89wYJwneE
         gOBYgAV7lRzb8D//idhHf6US58y/5Uui5ghVWWJO/8wcEIVyCTvz4AvKEghbWcudw4ru
         VGKA==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

Hello,

I'd like to use the "inet" address family in a named set. I see nft
supports the following address families [AF] (among others):

       ip       IPv4 address family.

       ip6      IPv6 address family.

       inet     Internet (IPv4/IPv6) address
                family.

However, looking at the named sets, I do not see the "inet" AF:

type  string: ipv4_addr, ipv6_addr, ether_addr, inet_proto, inet_service, mark

Are there plans to add "inet_addr" AF to the types of named sets?

I wouldn't mind using the symbolic variables (define variable = expr)
to achieve a combined ipv4, ipv6 set, but from the docs the variable
doesn't appear to be global in scope - unless they are defined at a
top level.

"""
Symbolic variables can be defined using the define statement. Variable
references are
expressions and can be used to initialize other variables. The scope
of a definition is the
current block and all blocks contained within.
"""

Any feedback about combined ipv4 and ipv6 address families in named
sets? or why an inet family does not exist for named sets?

Thanks for the help!

-m
