From: "Saeed Zamani" <szamani@tavanesh.com>
Subject: Need help on NAT
Date: Thu, 5 Feb 2004 10:48:50 +0330
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002401c3ebb8$4d7ccc00$f301a8c0@Zamani>
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

Hi all,
   I am new to list and have a basic nat question on Redhat Linux 9. I
have to translate my local IP ( 192.168.1.0/24 ) to two different public
IP given by two different ISP ( IPE1 & IPE2 ) at a specified rate. For
example for every 4 received packet, one have to translate to IPE1 and
other three to IPE2. I need this for load balacing the internet traffic
between two isp. At the end, it is excellent if there is an option that
If one the ISP gateway is dead, all packets have to translate to other
public IP. Please help me. 
Thanks, 
Saeed Zamani, 
Technical Manager, 
Concept FZ LLC. 



