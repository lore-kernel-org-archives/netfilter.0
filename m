From: Alon Altman <alon@vipe.technion.ac.il>
Subject: special NAT setup
Date: Thu, 12 Jun 2003 21:17:08 +0300 (IDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.50.0306122110001.9076-100000@alon1.dhs.org>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,
  I am trying to use netfilter for my home network, which is connected as
follows:

                 192.168.1.1    _______ 192.168.1.2
             (linux)      ______| PC1 | (linux)
      ADSL   ----------___|     ^^^^^^^
      =======| Router |---.      ______ (external IP)
  (external  ----------   |_____| PC2 | (win)
        ip)     192.168.2.1     ^^^^^^^

    I would like PC2 to have the same IP as the external ADSL link, so stuff
  like KaZaA will work best. I also like several ports to be forwarded to
  the win machine (PC2), while others should still be handled by the linux
  router.

    Also, I would like the router to do SNAT between PC1 and PC2, with
  minimum mangling as possible of the addresses.

    I have kernel 2.4.20 with patches as needed.

  Alon

-- 
This message was sent by Alon Altman (alon@alon.wox.org) ICQ:1366540
GPG public key at http://alon.wox.org/pubkey.txt
Key fingerprint = A670 6C81 19D3 3773 3627  DE14 B44A 50A3 FE06 7F24
--------------------------------------------------------------------------
 -=[ Random Fortune ]=-
Sleep is for the weak and sickly.

