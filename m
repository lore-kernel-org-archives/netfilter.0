From: Esteban <esteban@alstec.fr>
Subject: Netfilter and LDAP
Date: Wed, 7 May 2003 15:18:24 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030507151824.6acafbef.esteban@alstec.fr>
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

Hello all,

On a network, a have a LDAP database containing users profiles. Some
users may access diffeent services. While some users can access http,
some others cannot but can use ssh, etc.
I would like to put these informations in the LDAP database, and then
make Netfilter ask the LDAP database before accepting a packet or
creating a nez dynamic rule.
Is this possible ? and if yes, how ? or is there a different way to do
what I want ?

Thank you very much in advance.

-- 
Stephane DESMET
Alstec Informatique
17, rue du Colisee
75008 Paris

