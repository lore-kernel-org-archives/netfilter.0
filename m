From: Sanjay Arora <skpobox@hotpop.com>
Subject: What is best protection for RDBMS backend of web-server in DMZ
Date: 22 Aug 2004 21:13:12 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1093189392.16081.24.camel@Sewak.Asr.Lan>
Reply-To: skpobox@hotpop.com
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

Hi all

What are the issues involved in securing a RDBMS that is serving a web-server in DMZ. RDBMS is postgreSQL, OS is Linux, Webserver is Apache.

Application is CRM, Customer Registration/Editing is the main part that interacts with the web, Rest of the CRM application works in the Green subnet protected by an iptables firewall, specicically IPcop v. 1.3 presently. 

Should I bifurcate the DB and put the registration part in DMZ or should I put a copy of the registration part in DMZ and sync it periodically with the main DB. Or should I keep full DB on the Green Network & create a pinhole to access the RDBMS from the Green subnet, maybe in some kind of ssh tunnel. Any other ideas unknown to me that may be workable?

Can some one point me to resources that discuss these issues. Also, I would like the experienced people to please comment on pros & cons of various methodologies and pointers to security literature/checklists for Web-server/RDBMS security issues, especially on a shoestring budget with netfilter, linux & other open source tools. Please touch on various subjects like monitoring, recovery etc., so as to give me broad idea of scope of my research and pointers to resources.

With best regards and thanks in advance.
Sanjay.



