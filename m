From: Hudson Delbert J Contr 61 CS/SCBN <Delbert.Hudson@LOSANGELES.AF.MIL>
Subject: RE: SSH Connections Lost After 1 minute idle
Date: Tue, 13 Jul 2004 15:28:11 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7EACCDBB65D37443912D80713CC1245D02382A35@fsnsab20.losangeles.af.mil>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: "'Dick St.Peters'" <stpeters@NetHeaven.com>, netfilter@lists.netfilter.org

dick,

i beg to differ.

i must concur strongly with antony.

if you cripple icmp, your networks will break...


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Dick St.Peters
Sent: Tuesday, July 13, 2004 2:55 PM
To: netfilter@lists.netfilter.org
Subject: Re: SSH Connections Lost After 1 minute idle


Antony Stone writes:
> On Tuesday 13 July 2004 9:57 pm, Real Cucumber wrote:
> 
> > Why should ICMP not be completely blocked? The machine
> > is used strictly as a port forwarding firewall/router.
> 
> Because blocking all ICMP will break networking.   Look up the RFCs
explaining 
> what ICMP is for if you do not understand this.

I would like to second this vigorously, although I would phrase it
differently: blocking ICMP makes networks fragile.  Fragile networks
break easily when anything out of the ordinary happens.

--
Dick St.Peters, stpeters@NetHeaven.com 

