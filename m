From: "Paul Fontenot" <wpfontenot@cox.net>
Subject: nat
Date: Tue, 25 Nov 2003 22:31:00 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <GGEFKDNEPJHKAMAGGLFLGEDLCBAA.wpfontenot@cox.net>
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

Not sure what the ipfilter lingo is for what i want to do so I will
demonstrate with a Cisco PIX ACL.

access-list outside_access_in permit tcp any host 1.1.1.1 eq 3306

There would be a static for the 1.1.1.1 address:

static (inside,outside) 192.168.1.1 1.1.1.1

Where the MySQL server is running on host 192.168.1.1 and that ip is mapped
via a static translation to 1.1.1.1 on the PIX's outside interface.



