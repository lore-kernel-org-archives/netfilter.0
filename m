From: Eric Leblond <eric@inl.fr>
Subject: [Announce] Nuface, a Web-based administration tool for Netfilter
Date: Thu, 16 Jun 2005 12:17:52 +0200
Message-ID: <42B151D0.8080605@inl.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

INL and the NuFW core team are proud to announce the initial release of 
Nuface.

Nuface is a Web-based administration tool that generates Edenwall, NuFW, 
or simple Netfilter firewall rules. It features a high level abstraction 
on the security policy set by the administrator, and works internally on 
an XML data scheme. Its philosophy is to let you agglomerate subjects, 
resources, or protocols into meta-objects, and use those meta objects to 
generate ACLs, which are then interpreted as netfilter rules by Nupyf, 
the internal XML parser.

It integrates with NuFW, the authenticating firewall, and Nulog, the 
netfilter log analysis interface, to form EdenWall which is a packaged 
solution available from INL.

Nuface is available under GPL licence as well as NuFW and Nulog.

Nuface: http://www.inl.fr/article.php3?id_article=39 
<http://freshmeat.net/redir/nuface/58782/url_homepage/article.php3>
NuFW: http://www.nufw.org/
Nulog: http://www.inl.fr/article.php3?id_article=36
EdenWall: http://www.inl.fr/article.php3?id_article=18
INL: http://www.inl.fr/

Best Regards,
--
Eric Leblond

