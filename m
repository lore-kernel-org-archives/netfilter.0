From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: conntrack GRE behaves differently in 3.17 / 3.18
Date: Thu, 22 Jan 2015 17:28:58 -0500
Message-ID: <201501221728.59122.neal.p.murphy@alum.wpi.edu>
References: <f37def15eb82a2685c1041db1b37454e@d119.x-mailer.de> <54C15E96.9060708@plouf.fr.eu.org> <20150122225138.Horde.IXk-nfaQwvQnI1tCRBV7DA3@htjn.suhail.uberspace.de>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20150122225138.Horde.IXk-nfaQwvQnI1tCRBV7DA3@htjn.suhail.uberspace.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Thursday, January 22, 2015 04:51:38 PM Jan Niggemann wrote:
> Zitat von Pascal Hambourg <pascal@plouf.fr.eu.org>:
> > The bottom line is : if you use PPTP and conntrack with any kernel
> > version, load nf_conntrack_pptp (it will load nf_conntrack_proto_gre
> > automatically) and accept GRE packets in the ESTABLISHED,RELATED states.
> 
> Thank you for testing this.
> I still have tons to learn, but I realized that I can use the pptp
> connection without any helper modules by explicitly ACCEPTing gre
> packets from the VPN server:
> #iptables -S
> -P INPUT DROP
> -P FORWARD DROP
> -P OUTPUT ACCEPT
> -A INPUT -i lo -j ACCEPT
> -A INPUT -s XX.XX.XX.XX/32 -p gre -j ACCEPT
> -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
> 
> So now I know 2 possibilities that work, either loading
> nf_conntrack_pptp or the aforementioned rule to accept gre packets.
> Which of both is a "better" approach with regards to security,
> performance, ...?

[Without being thoroughly pedantic; a complete technical explanation would 
include everything the helpers do]

Using the helper is the better approach. It positively ties the related GRE 
packet 'stream' to its PPTP control conn, allowing only those that the 
validated control conn has requested. Otherwise, you would be admitting *any* 
GRE stream from the server, even those that are not 'validated'. (Worst case? 
Malware could set up a tunnel using GRE.)

The idea is the same with the FTP helper; only those data conns that are 
associated with a command from a validated control session to transfer data 
are allowed to connect. If you allowed every FTP data conn, anyone could use 
the FTP data ports to transfer data.

But it boils down to how tightly you want to control your firewall and the 
packets that traverse it. My philosophy is, "Block all incoming and outgoing 
conns except those I explicitly allow and those I implicitly allow via 
helpers." Your philosophy may differ.
