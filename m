From: Frederic Gobin <frederic.gobin@earthtvnet.com>
Subject: ulog daemon : undefined symbol: mysql_connect
Date: Thu, 24 Apr 2003 13:20:20 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BBFCA355-7646-11D7-84F3-0003938423EC@earthtvnet.com>
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

I currently trying th ulog daemon and have a little problem :

Each time I start the daemon, I get the following error :

Thu Apr 24 14:16:34 2003 <7> ulogd.c:455 load_plugins: 
'/usr/local/lib/ulogd/ulogd_MYSQL.so': 
/usr/local/lib/ulogd/ulogd_MYSQL.so: undefined symbol: mysql_connect

Used build steps :

	configure --with-mysql
		(without problems, even find mysql at the right place ...)
	make
		(had some problems, resolved them by changing a line in the 
Rules.make:
		From :
			MYSQL_CFLAGS=-I/usr/local/mysql/include/mysql
		To :
			MYSQL_CFLAGS=-I/usr/local/mysql/include
		After that, no compile problems.)
	make install
		(no problems)

Used versions :
	Kernel	: 2.4.20
	Netfilter	: 1.2.7a
	Ulogd	: 1.0
	Mysql	: 4.0.12

I hope that somebody can help ...

Thanks for reading

Frederic Gobin


