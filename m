From: "Nathan Cassano" <nathan@cjhunter.com>
Subject: RE: debugging rc.firewall
Date: Tue, 18 Jun 2002 10:30:53 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <002301c216ed$e5ed7580$2901a8c0@amos>
References: <20020618130639.2ec22286.mt@open2web.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020618130639.2ec22286.mt@open2web.com>
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
To: 'Mark Tessier' <mt@open2web.com>
Cc: netfilter@lists.samba.org


Hi Mark,
	Perhaps you are just looking in the wrong places. Have you tried
the 'dmesg' command to view the kernel message output? Check out your
syslog.conf you see that you are properly logging kernel messages. 

I use the following logging configuration.

/etc/syslog.conf
kern.*             -/var/log/kernel

Finally give the syslogd a 'kill -HUP' if you change this file.


