From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Hello -- kind of of topic -- but still related
Date: Wed, 3 Dec 2003 22:34:22 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312032234.22291.Antony@Soft-Solutions.co.uk>
References: <20031203151030.31eaeacd.mgale@utilitran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031203151030.31eaeacd.mgale@utilitran.com>
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

On Wednesday 03 December 2003 10:10 pm, Michael Gale wrote:

> In my log I am seeing the following -- but our production FTP server is
> currently out side of our network so we can connecting to it through a
> Cisco router. Not my doing :( Dec  3 15:00:57 lightning kernel:
> Firewall:IN=eth0 OUT= MAC=X.X.X.X SRC=CISCO_ROUTER DST=FTP_SERVER LEN=40
> TOS=0x00 PREC=0x00 TTL=255 ID=16538 PROTO=TCP SPT=5 DPT=35607 WINDOW=0
> RES=0x00 ACK RST URGP=0
>
> There are a large number of these packets -- at first it thought maybe it
> was the Cisco router doing something funny when a FTP connect closed and it
> was trying to close or reset the data channel.
>
> Any ideas ?

The packet in the log above has ACK and RST set - that suggests that the 
remote end has rather abruptly decided to terminate the connection (ACK and 
FIN would be used for a polite termination).

However - Source Port 5???  Remote Job Entry???   That seems so unlikely...

Frankly I can't see that it has anything to do with FTP service at all.

It would be useful to know what network activity preceded this log entry - 
what was someone trying to do (almost certainly starting from the FTP server, 
sending to the router)?

Antony.

-- 
You can spend the whole of your life trying to be popular,
but at the end of the day the size of the crowd at your funeral
will be largely dictated by the weather.

 - Frank Skinner

                                                     Please reply to the list;
                                                           please don't CC me.


