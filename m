From: Hudson Delbert J Contr 61 CS/SCBN <Delbert.Hudson@LOSANGELES.AF.MIL>
Subject: RE: problem with hook function for DHCP
Date: Tue, 30 Nov 2004 13:52:23 -0800
Message-ID: <29F6FAF7F2C0D41190980002A513591E0E93BABB@FSNSAB30>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_000_01C4D726.D03C08A6"
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: 'Jason Opperisano' <opie@817west.com>, netfilter@lists.netfilter.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_000_01C4D726.D03C08A6
Content-Type: text/plain;
	charset="iso-8859-1"

why not try tcpdump or hardware sniffer onm the lan itself.

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of Jason
Opperisano
Sent: Tuesday, November 30, 2004 12:42 PM
To: netfilter@lists.netfilter.org
Subject: Re: problem with hook function for DHCP


On Mon, Nov 29, 2004 at 11:58:44PM -0800, Subhash Gopinath wrote:
> Hello all,
> 
> I am facing problems capturing DHCP packets sent from a client to a
server....
> Basically, the hook function (defined below) is not getting called for
> each packet going out of the system.. Any ideas ?

my idea:  DHCP packets are generated and processed at the BPF layer
(which is below netfilter in the stack); and never pass through any
netfilter hooks.

-j

--
"Default! The two sweetest words in the English language!"
        --The Simpsons

------_=_NextPart_000_01C4D726.D03C08A6--

