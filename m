From: Marian Stepka <marians@itdimensions.com>
Subject: Slow FTP through NAT box...
Date: Fri, 13 Sep 2002 22:07:08 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D8299CC.1CFC740A@itdimensions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Hi List;

I'm fighthing with NATing issues almost 3 days. Now I'm facing problem,
that It take extremly long to get passive ftp access to the machine
after NAT box. I can access it just using ftp command line client from
Linux machine and none from Win working even PASV mode is enabled. But
anyway initial handshaking take a pretty long, let's say 2 minutes. Box
do nothing else just translate range from priavte IP range to normal
Inet range.

Other services works pretty well as ssh, web. But FTP driving me
slightly mad. Do anybody out there have any idea what I did wrong or
when I can find some info about? Probably I read whole Google. Or I'm
blind or what...

Marian

--
*IN ROOT WE TRUST*
Marian Stepka <mailto:stepka@tris.sk>

