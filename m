From: "Marc Fargas" <telenieko@telenieko.com>
Subject: RE: Need urgent help on NAT/load sharing
Date: Fri, 6 Feb 2004 11:29:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <42F50AA0D75@fargas.com>
References: <003701c3ec0c$f8cc09f0$6329d9d5@Zamani>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003701c3ec0c$f8cc09f0$6329d9d5@Zamani>
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

The Linux Advanced Routing Howto makes a point on it, take a look at
www.lartc.org specifically:
http://lartc.org/howto/lartc.rpdb.multiple-links.html
You'll only have to change the weight on the lines. Also note that you can
onlky balance outgoing connections that way, not inbound ones.

Hope this helps you ;)



-----Mensaje original-----
De: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] En nombre de Saeed Zamani
Enviado el: jueves, 05 de febrero de 2004 18:25
Para: netfilter@lists.netfilter.org
Asunto: Need urgent help on NAT/load sharing

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








