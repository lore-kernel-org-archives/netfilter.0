From: alucard@kanux.com
Subject: Re: forwarding on the same NIC
Date: Tue, 11 May 2004 17:02:13 -0400 (VET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4106.200.44.170.105.1084309333.squirrel@200.44.170.105>
References: <3401.200.44.170.105.1084217773.squirrel@200.44.170.105> 
    <200405102115.14089.Antony@Soft-Solutions.co.uk> 
    <1292.192.168.74.154.1084226963.squirrel@192.168.74.154> 
    <1084227992.14224.5.camel@localhost> 
    <1166.200.44.170.105.1084283379.squirrel@200.44.170.105> 
    <1084288178.15768.10.camel@localhost> 
    <2022.200.44.170.105.1084289894.squirrel@200.44.170.105> 
    <1084295076.15641.54.camel@localhost> 
    <3506.200.44.170.105.1084304149.squirrel@200.44.170.105>
    <1084306180.15631.68.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1084306180.15631.68.camel@localhost>
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


John A. Sullivan III wrote:
> Ah, OK - between this reply and your replay to Aleksander, it's starting
> to become a bit more clear.  The router is a corporate router to the
> outside world over which you have no control.  This internal 10 network
> where the Linux box and 2nd Webserver sit IS the entire internal network
> with a 22 bit mask and housing all users who directly access the 2nd
> WebServer on the LAN.  You want the WebServer accessible to the world
> but, because of politics, bureaucracy, etc., you only have control over
> the Linux box.  Do I understand it thus far?

Exactly :)

>
> Do you have the freedom to insert a second NIC into the 2nd WebServer?
> If so, you can insert a second NIC into both devices, set the default
> gateway for the 2nd WebServer to the Linux Box and allow world access
> through this second network.

No, I don't but, I'm just going to have to go through all the steps in
this company to get it in order to do what they require.

> One way or another, you are going to have to touch the 2nd WebServer
> even if just to change its default gateway to the LinuxBox so that its
> reply packets to the world pass through the Linux Box.  If you cannot
> get it on a separate network by hook or by crook, you'll have to
> investigate bridging.  I think there is something at
> http://ebtables.sourceforge.net/ but I have never played with it.  Good
> luck - John

To make matters worse, the second webserver is IIS and I have no idea how
to use IP Multiplexing on Win2k, I could do it in linux but Windows
systems are not my expertise. What I'm going to do -if I get the
permission- is this: Install a 2nd nic on the 2nd webserver so the IP
address that is being used doesn't get affected and I will configure it's
router to the linux box so it can redirect packets where they should go...

Thanx a lot for this great help, I really mean it... this mailing list is
simply great

Juan

