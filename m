From: Geraldo Macedo <glmacedo@quality.com.br>
Subject: UML and Firewall
Date: 19 Jun 2002 16:47:28 -0300
Sender: netfilter-admin@lists.samba.org
Message-ID: <1024516048.26896.189.camel@ux-glmacedo.intranet.quality.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org
Cc: Humberto Baltazar Morais <hbmorais@ig.com.br>

Greetings from Rio de Janeiro/Brazil,

Has anyone on the list tried to use UML (User Mode Linux) o host a
firewall and separate machines?

For example:

                Router
                |
                |
                |
                UML Host
                |-------------> Firewall
                |-------------> HTTPd
                |-------------> QMAIL
                |
                |
        ---------------------
        Internal Network

Sorry for my bad ASCII graph...

If yes, can anyone tell me how safe it is?  I've read that you can wholy
separate the machines, and that a compromise to one of the hosted
machines will not give access to anything else, and that I can
automatically route every packet that gets to the host machine to the
hosted firewall.

Has anyone used this setup?

Please reply directly to this e-mail, as I'm not currently on the
mailing list.

Best Regards,
-- 
Geraldo Macedo		| Phone: +55 21 34753009
Unix Administrator	| e-mail: glmacedo@quality.com.br
Quality Software	|


