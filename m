From: Frederic Gobin <frederic.gobin@earthtv.com>
Subject: ulogd : undefined symbol (mysql_connect)
Date: Wed, 23 Apr 2003 14:09:09 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <63367C07-7584-11D7-89DA-0003938423EC@earthtv.com>
Mime-Version: 1.0 (Apple Message framework v552)
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi there,

I currently have a problem with the ulogd. Each time I try to start it, 
I get this error :

Wed Apr 23 14:18:42 2003 <7> ulogd.c:455 load_plugins: 
'/usr/local/lib/ulogd/ulogd_MYSQL.so': 
/usr/local/lib/ulogd/ulogd_MYSQL.so: undefined symbol: mysql_connect

Note that I had a little problem compiling it ...

A simple "configure --with-mysql" ran without problems, but compile the 
daemon I had to change a line in the "Rules.make" :
From
	MYSQL_CFLAGS=-I/usr/local/mysql/include/mysql
to
	MYSQL_CFLAGS=-I/usr/local/mysql/include


Used versions :
	Kernel 2.4.20
	MySQL 4.0.12
	Netfilter 1.2.7a
	ulogd 1.00

Thanks for reading

Freddy


