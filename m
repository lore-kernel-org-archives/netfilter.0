From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Hello -- kind of of topic -- but still related
Date: Thu, 4 Dec 2003 00:27:46 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312040027.46440.Antony@Soft-Solutions.co.uk>
References: <20031203151030.31eaeacd.mgale@utilitran.com> <200312032336.14650.Antony@Soft-Solutions.co.uk> <20031203171805.475ec7af.mgale@utilitran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031203171805.475ec7af.mgale@utilitran.com>
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

On Thursday 04 December 2003 12:18 am, Michael Gale wrote:

> Ok -- as I look into the Cisco router issue .. is there any way to make it
> so when a ftp connection comes in and Inetd using tcpwrappers to pass the
> connection to my FTP server that NO Ident lookups are done :)

Sure - simply remove the "tcpd" bit of the entry in /etc/inetd.conf and just 
point to the ftpd daemon itself.

If you're not sure what to do, post the line from /etc/inetd.conf which begins 
with "ftp" and we'll try to help.

Antony.

-- 
Anyone that's normal doesn't really achieve much.

 - Mark Blair, Australian rocket engineer

                                                     Please reply to the list;
                                                           please don't CC me.


