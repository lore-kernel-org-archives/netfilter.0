From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: Re: Dual WAN set-up
Date: Thu, 12 Jan 2012 18:52:15 -0600
Message-ID: <op.v7zzdd0cx1lyi3@debiandesk2.net>
References: <201201121651.18887.dyioulos@onpointfc.com>
 <op.v7zujutux1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <op.v7zujutux1lyi3@debiandesk2.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>, Lloyd Standish <lloyd@crnatural.net>

Sorry, there are a couple of probably obvious errors in my post, aside from the bad numbering.  This is because when I first wrote this, I gave the DMZ special hosts routing table the name "MYDMZ", but then changed it to "DMZSPECIAL", for clarity. The erred lines are corrected below:

On Thu, 12 Jan 2012 17:08:08 -0600, Lloyd Standish <lloyd@crnatural.net> wrote:


> 2. You would set up a custom routing table for the special DMZ traffic.  Use the info in the above link to do that.  Suppose it is called "DMZSPECIAL".  You will set up routing to the new DMZ interface using the MYDMZ table, something like this:

I meant to say above, "...using the DMZSPECIAL table, something like this:"

<snip>

>
> Then add a policy routing rule, directing all traffic with the "1" mark to the new DMZ uplink:
>
> 	ip rule add fwmark 1 table MYDMZ
This should of course be:
ip rule add fwmark 1 table DMZSPECIAL

-- 
Lloyd
