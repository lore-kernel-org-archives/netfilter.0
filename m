From: "Leonardo Santagostini" <lsantagostini@celletech.com.ar>
Subject: A question and a little ascii art
Date: Tue, 21 Oct 2003 10:45:13 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002201c397d9$8d663910$1e32a8c0@celletech.com.ar>
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

Sorry by bothering us but i think my explanation in some point was
wrong, here is the ERRATA

       _________Machine A
      /
   Internet
      | _____200.68.69.XXX
      |/
  Fw / Apache
      |\
      | \____192.168.0.254
      |
      |
   --------------------------------------
   |                  |                  |
192.168.0.1        192.168.0.25        192.168.0.XXX
 NT / IIS

1) The goal is: Folowing one link at my isp to 200.68.69.XXX:someport
(in my case 15000) to launch an app located in my NT box. (This point
works fine only FROM Internet not from my LAN)
2) When im pointing from my LAN to 200.68.69.XXX:15000 (this is because
the main app page (not application) is located at my ISP) cant see de
IIS (and i think that i must be automaticaly delivered to)

Maybe this short (uh)!! Explanation can help

Yours,
Leonardo


