From: Robert White <rwhite@pobox.com>
Subject: Suggestion: Default (else) value for maps, dictionaries, and Verdicts
Date: Thu, 16 Mar 2017 23:55:35 +0000
Message-ID: <b32fd2e4-d3e5-8519-6b6c-e218781a813f@pobox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Being able to set (and preferably modify at runtime) a default value to 
be returned/evaluated/executed for the various search-and-do lists 
(sets) would be extremely helpful.

You can kind of fake it with a verdict set of goto(s) and a subsequent 
unconditional goto but that's branchtastically elaborate.

So the existence of a possible default would be value-attached flag 
(just like timeout is a flag with a value).

I don't have the familiarity with the whole stack (nft, library, and 
kernel state machine) necessary to offer a patch at this time since it 
would take a nudge of all three to be able to test it all.

-- Rob White.
