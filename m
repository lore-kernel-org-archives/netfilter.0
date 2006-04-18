From: Sebastien Tandel <standel@info.ucl.ac.be>
Subject: Re: udp clients
Date: Tue, 18 Apr 2006 13:58:22 +0200
Message-ID: <4444D45E.604@info.ucl.ac.be>
References: <44447DB9.4080409@elgas.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44447DB9.4080409@elgas.com.au>
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
Content-Type: text/plain; charset="us-ascii"
To: Dallas Clarke <dallas.clarke@elgas.com.au>, netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

Can you give some more precision?

What's the physical network configuration? how are the network
interfaces configured?
then
   iptables -L -v -n
   iptables -t nat -v -n
   route -n

thx

Dallas Clarke wrote:
> Hello All,
> 
> I am running a udp client behind an iptables firewall, I can open a
> socket, send from the socket, but I can only receive one packet back
> from the server - all other packets are blocked.
> 
> Is this the standard way netfilter works, have I configured something
> wrong (straight out of the box fedora core 5).
> 
> This is a real problem from me since I can't expect every user to drop
> their firewall so they can use our client software.
> 
> Thanks
> 
> Dallas.
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFERNRew76McB8jGxkRAnsLAJ0eiuyMB+gfnDtQknHuuregF4yKHgCfZRtt
BhSwQ6TuK5s/5wEVcNIwj5k=
=st47
-----END PGP SIGNATURE-----

