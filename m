From: root <root@alexis.macam.ac.il>
Subject: How to use apache redirect with iptables
Date: Wed, 15 May 2002 16:24:06 +0300
Sender: netfilter-admin@lists.samba.org
Message-ID: <200205151324.g4FDO6L16851@alexis.macam.ac.il>
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

Hello All
I configure Iptables with 3 cards external,lan and dmz.
I have 2 http servers in the dmz .Packets that coming in to port 80 I am doing DNAT to a 
web server in the DMZ.I try to do apache redirect from this web server (in the httpd.conf -redirect option
 Redirect / http://192.168.1.3) to another web server 
in this segment but it is not working.
Does anyone know how to do this?
 
 
 
                                             Thanks in advance Nir

