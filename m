From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Bandwidth Monitoring
Date: Sun, 31 Aug 2003 03:03:58 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030831030358.4f75b5dc.arnt@c2i.net>
References: <04a901c36e18$ad2d6650$2a0110ac@SAMHP>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <04a901c36e18$ad2d6650$2a0110ac@SAMHP>
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

On Fri, 29 Aug 2003 16:01:11 +0530, 
"Sathi" <sathiyan@gmx.net> wrote in message 
<04a901c36e18$ad2d6650$2a0110ac@SAMHP>:

> Hello All,
> 
> Is there any way to findout the bandwidth used by a client(LAN user),
> from Linux gateway server.
> 
> I have to take monthly statistics of bandwidth used by a client (LAN
> user).

..several, 'iptables -vnL' shows how much traffic etc per rule, 
setting up rules per user and 'iptables -vnL' every month etc 
is one way, there is MRTG, ntop, RRD etc.
 
> FYI i am using CBQ for bandwidth control

...for each user?  Try 'http://fmb.no/ipcop/setup-cbq-0.0.4.tar.bz2', 
I'm open for ideas etc on -0.0.5.  ;-)

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.


