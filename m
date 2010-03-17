From: Robert Nichols <rnicholsNOSPAM@comcast.net>
Subject: Re: Rules PREROUTING doesn't work
Date: Wed, 17 Mar 2010 08:14:43 -0500
Message-ID: <hnqkk4$62v$1@dough.gmane.org>
References: <1c1b5a0f1003162027s73fe4756yefd48b436375b04b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1c1b5a0f1003162027s73fe4756yefd48b436375b04b@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 03/16/2010 10:27 PM, Angel Motta wrote:
> Hi List
> This is my first time the I write to this list. I have a problem case
> with rules PREROUTING.
> I am creating a rule PREROUTING from a range of port which request
> openvpn client and the problem is that when I apply this rules and
> only rules NATs are runing (PREROUTING and POSTROUTING the output of
> #>  iptables -L is blank) the clients openvpn still conect to the
> Firewall and not to the SERVERVPN, all requests are processed for
> firewall.
>
> this is the rule:
> $IPT -t nat -A PREROUTING  -i $IF_EXT -d $TESTVPN -p udp --dport
> 5000:6000 -j DNAT --to-destination $IP_DMZ_SERVERVPN

That listing command needs to be "iptables -t nat -L".  The default is
to display only the filter table, which doesn't include the above rule.

-- 
Bob Nichols     "NOSPAM" is really part of my email address.
                 Do NOT delete it.

