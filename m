From: "Younger Wang" <younger.wang@42networks.com>
Subject: RE: Is it possible to forward broadcasting with IPtables?
Date: Wed, 7 Apr 2004 19:07:37 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c41c90$8a969810$1664640a@Younger>
References: <200404071040.31480.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404071040.31480.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

If the broadcast packets traverse the chains, they should be put to
INPUT chain. Is there a way to transfer a packet from INPUT chain to
FORWARD chain?  

Even though broadcast is not expected to go beyond router, forwarding
certain broadcast packets can be very useful in many scenarios. 

BR
Younger Wang

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Antony Stone
Sent: Wednesday, April 07, 2004 5:41 PM
To: netfilter@lists.netfilter.org
Subject: Re: Is it possible to forward broadcasting with IPtables?

On Wednesday 07 April 2004 7:38 am, Younger Wang wrote:

> Hi All,
>
> I am seeking a way to forward WINs broadcast.

Use a WINS server.   That will forward peer discovery requests to other 
subnets.   Samba will do the job nicely.

> Is it possible to be done with iptables? If not, is there a standard
way
> to do broadcast forwarding?

There is no way to generically forward network broadcasts, otherwise the

entire Internet would get flooded with them.   Broadcasts are designed
to 
reach every machine on a local subnet, and no others.

Regards,

Antony.

-- 
This email is intended for the use of the individual addressee(s) named
above 
and may contain information that is confidential, privileged or
unsuitable 
for overly sensitive persons with low self-esteem, no sense of humour,
or 
irrational religious beliefs.

If you have received this email in error, you are required to shred it 
immediately, add some nutmeg, three egg whites and a dessertspoonful of 
caster sugar.   Whisk until soft peaks form, then place in a warm oven
for 40 
minutes.   Remove promptly and let stand for 2 hours before adding some 
decorative kiwi fruit and cream.   Then notify me immediately by return
email 
and eat the original message.

                                                     Please reply to the
list;
                                                           please don't
CC me.



