From: Pawel Pilat <poster_pl@yahoo.com>
Subject: <SOLVED> ECN Problem : Thnx Mark E. Donaldson !
Date: Sun, 27 Jun 2004 06:15:32 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040627131532.87899.qmail@web13425.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello

lucky combination ... :)

IPT <...> -j ECN --ecn-tcp-remove on incoming
interface
IPT <...> -p tcp --tcp-flags SYN,RST SYN -j TCPMSS  
--clamp-mss-to-pmtu on outgoing interface

and most interesting ...
IPT <...> -j TTL --ttl-set 128 on outgoing interface
!!! M$ rules ? :)

once more - thnx to Mark
best regards

Pawel Pilat





	
		
__________________________________
Do you Yahoo!?
New and Improved Yahoo! Mail - 100MB free storage!
http://promotions.yahoo.com/new_mail 

