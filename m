From: Daniel Miller <dmiller@amfes.com>
Subject: Forwarding DNS
Date: Thu, 05 Feb 2004 10:27:26 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40228B0E.3080906@amfes.com>
Reply-To: dmiller@amfes.com
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Can I setup a DNS forward for my LAN to point to my ISP's DNS servers 
for internet name resolution?  As I'm on a high-speed connection, and my 
provider has already implemented their own caching DNS servers, it seems 
(at least on the surface) silly for me to implement my own caching-only 
server.  This way, I can choose to implement direct forwarding to my 
ISP's servers, or use an internal caching-only server, and have it 
transparent to the LAN.

Daniel

