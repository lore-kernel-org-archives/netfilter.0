From: zrm <zrm@trustiosity.com>
Subject: Re: Unable to query reply direction with conntrack-tools /
 libnetfilter_conntrack
Date: Thu, 8 Feb 2018 14:22:35 -0500
Message-ID: <dc9650cb-2335-0878-0948-23ed7d5a3327@trustiosity.com>
References: <CANtbet1vQmGGFw7f7MkSC=+x1QWEnJA-_rEu0AT22QH4zF-FNg@mail.gmail.com>
 <c7021b70-1006-759c-bc89-15616160323a@trustiosity.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <c7021b70-1006-759c-bc89-15616160323a@trustiosity.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Omri Bahumi <omri.il@gmail.com>, netfilter@vger.kernel.org

On 02/08/2018 11:34 AM, zrm wrote:
> This is part of the API.
> 
> Notice that ATTR_PORT_SRC and ATTR_PORT_DST exist but are aliased to 
> ATTR_ORIG_PORT_SRC and ATTR_ORIG_PORT_DST, and likewise for 
> ATTR_IPV[46]_SRC and ATTR_IPV[46]_DST to ATTR_IPV[46]_ORIG_SRC and 
> ATTR_IPV[46]_ORIG_DST.
> 
> The REPL values work on data that comes back from the kernel, so if you 
> use NFCT_Q_GET to get a struct nf_conntrack it will have those values 
> filled in and you can query them, but NFCT_Q_GET empirically doesn't use 
> them to match with. It only uses the ORIG values, i.e. the ones the 
> non-directionally-named constants are aliased to.
> 
> But it seems to match in both directions. So ATTR_PORT_SRC will match 
> either ATTR_ORIG_PORT_SRC (which has the same value) or 
> ATTR_REPL_PORT_DST (which doesn't). As long as they all go together, 
> i.e. it won't match ATTR_PORT_SRC with ATTR_ORIG_PORT_SRC and 
> ATTR_PORT_DST with ATTR_REPL_PORT_SRC, but it will match if every SRC 
> address and port matches a REPL_DST and every DST matches a REPL_SRC.
> 
> Which makes some sense, because if there is an entry with all those 
> values as REPL_DST and REPL_SRC then there can't be one with the same 
> values as ORIG_SRC and ORIG_DST.
> 
> Also, newer versions of the conntrack command do have --reply-port-src 
> and --reply-port-dst, but they don't seem to actually work with -G, 
> consistent with the API behavior. But reversing --src with --dst and 
> --sport with --dport doesn't seem to work with the conntrack command 
> either. I haven't investigated what's going on there, but maybe the 
> command itself is filtering them after the fact, so when you ask for 
> --dport and the kernel gives that as the repl dst/orig src port it 
> claims no match.

Hmm. I might have had part of that backwards, i.e. ATTR_PORT_SRC will 
match ATTR_ORIG_PORT_SRC or ATTR_REPL_PORT_SRC (not ATTR_REPL_PORT_DST), 
provided everything else matches for the same direction (ORIG or REPL).
