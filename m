From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: http PREROUTING works but other ports do not
Date: Wed, 12 Nov 2008 00:09:04 -0600
Message-ID: <491A7300.5010200@riverviewtech.net>
References: <20081110194846.79984f14@zas.gateway.2wire.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20081110194846.79984f14@zas.gateway.2wire.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/10/2008 7:48 PM, mictlan tecutli wrote:
> i'm using iptables v1.2.3. i got a strange problem where i'm using 
> esentialy the same rules to forward  (PREROUTING) various ports in a 
> vserver setup with a single static ip (xxx.xxx.xxx). my vservers on on 
> the 10.10.10.0 network. with the configuration i've attached to this 
> mail, i can view the web pages hosted in 10.10.10.20, but can not reach 
> the ssh servers on the same host, nor those on other hosts. nor can i 
> reach icecast on port 8000. in the config i've included, you'll se i've 
> tried subtle variations on the distint hosts. none of the variations you 
> see there work.

I can't say for sure, but I do see a few things that are odd.
  - You are making reference to both ports 2220 and 2222.  Is one of 
them a typo?
  - I can't tell what your real destination IP is, xxx.xxx.xxx.0/24 
(your subnet) or xxx.xxx.xxx.9 (a specific host).  I'm going to think 
that it's .9 and refer back to the above point.
  - Will you please clarify what is your internal and external 
interface, eth0 verses what?
  - Do you have specific IPs in your network assigned / allocated to 
individual virtual servers?  Or are you doing everything based on port?

> i'd apreciate any help.

Think about and respond to the above.  I can't do much more with out 
some more information.



Grant. . . .
