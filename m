From: Stephen Satchell <list@satchell.net>
Subject: Re: Waiting until first release of NFTABLES
Date: Sun, 23 Feb 2020 21:02:40 -0800
Message-ID: <b0399d25-901e-38a8-7359-8096516a818e@satchell.net>
References: <c4e081c5-3bb9-827e-a382-388fe4d859de@satchell.net>
 <875zfwssw1.fsf@goll.lan>
Reply-To: list@satchell.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <875zfwssw1.fsf@goll.lan>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 2/23/20 4:58 PM, Trent W. Buck wrote:
> CentOS runs systemd, so rp_filter=1 (or =2 since v240) should be on by default:

"CentOS Linux release 8.1.1911 (Core)"  has this line:> 
net.ipv4.conf.all.rp_filter = 1

rp_filter is indeed '1'
log_martians is '0'

Since I want rp_filter=1 instead of 2 (I'm not multi-homed) I'll do the 
override according to the documentation; specifically, I'll add my 
overrides to /etc/sysctl.d/99-sysctl.conf -- then I'll check to see that 
the two kernel knobs are set correctly for all interfaces.

And, yes, I meant BCP-38.

As for other packages with version numbers of 0.x, I'm not all that 
concerned in a firewall router for anything except the firewall facility 
itself.  This router will have, as its sole job, filtering incoming and 
outgoing packets to my upstream.

Thank you for your comments.
