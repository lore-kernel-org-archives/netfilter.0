From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: MRTG and IPTABLES
Date: Wed, 7 Jan 2004 09:44:57 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401070944.57322.Antony@Soft-Solutions.co.uk>
References: <83055D4B014C9E478D2F04624B9E82CFAE9658@noveldc.novelgmt.mu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <83055D4B014C9E478D2F04624B9E82CFAE9658@noveldc.novelgmt.mu>
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

On Wednesday 07 January 2004 9:34 am, Gilles Yue wrote:

> Hi,
> 	Opening port 1491 does not work.  Any other idea?

As far as I know SNMP uses UDP ports 161 and 162.   This is confirmed by the 
entries in my /etc/services file too.

I don't know if that's what MRTG uses, but might be worth trying.

The other approach is to turn on LOGging of dropped packets on your firewall - 
try using MRTG and see what protocols/ports you see being dropped.   That 
will tell you what you need to allow through.

Antony.

> -----Original Message-----
> From: Eugene Joubert [mailto:EugeneJ@centratel.co.za]
> Sent: Wednesday, January 07, 2004 12:29 PM
> Cc: netfilter@lists.netfilter.org
> Subject: RE: MRTG and IPTABLES
>
> Hi,
>
> It uses SNMP protocol. I think this is built on top of the UDP protocol.
> I
> am not sure. Try opening up UDP port 1491.
>
> Hope this helps
>
> Eugene
>
> -----Original Message-----
> From: John A. Sullivan III [mailto:john.sullivan@nexusmgmt.com]
> Sent: 07/01/2004 10:04 AM
> To: Gilles Yue
> Cc: netfilter@lists.netfilter.org
> Subject: Re: MRTG and IPTABLES
>
> On Wed, 2004-01-07 at 01:54, Gilles Yue wrote:
> > MRTG cannot work properly due to iptables running.
> >
> >
> >
> > Anybody knows which port number to open to enable MRTG to work
> > properly.
>
> <snip>
>
> No, not off hand but you can use a tool like Ethereal
> (http://www.ethereal.com) or just tcpdump or even just log the ropped
> packets in iptables to determine what MRTG is trying to do.  Good luck -
> John

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


