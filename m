From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Is it possible to forward broadcasting with IPtables?
Date: Wed, 7 Apr 2004 10:40:31 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404071040.31480.Antony@Soft-Solutions.co.uk>
References: <000001c41c6a$e971b1b0$1664640a@Younger>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000001c41c6a$e971b1b0$1664640a@Younger>
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

On Wednesday 07 April 2004 7:38 am, Younger Wang wrote:

> Hi All,
>
> I am seeking a way to forward WINs broadcast.

Use a WINS server.   That will forward peer discovery requests to other 
subnets.   Samba will do the job nicely.

> Is it possible to be done with iptables? If not, is there a standard way
> to do broadcast forwarding?

There is no way to generically forward network broadcasts, otherwise the 
entire Internet would get flooded with them.   Broadcasts are designed to 
reach every machine on a local subnet, and no others.

Regards,

Antony.

-- 
This email is intended for the use of the individual addressee(s) named above 
and may contain information that is confidential, privileged or unsuitable 
for overly sensitive persons with low self-esteem, no sense of humour, or 
irrational religious beliefs.

If you have received this email in error, you are required to shred it 
immediately, add some nutmeg, three egg whites and a dessertspoonful of 
caster sugar.   Whisk until soft peaks form, then place in a warm oven for 40 
minutes.   Remove promptly and let stand for 2 hours before adding some 
decorative kiwi fruit and cream.   Then notify me immediately by return email 
and eat the original message.

                                                     Please reply to the list;
                                                           please don't CC me.


