From: Stephen Smoogen <smoogen@lanl.gov>
Subject: Re: putting all logs in a file
Date: Wed, 10 Sep 2003 06:45:31 -0600 (MDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0309100644040.15305-100000@cic-mail.lanl.gov>
References: <200309101112.QAA09833@WS0005.indiatimes.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200309101112.QAA09833@WS0005.indiatimes.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akshaysalkar <akshaysalkar@indiatimes.com>
Cc: netfilter@lists.netfilter.org



You can change the log level with the --log-level addtion to any -j LOG 
lines

LOG_LEVEL="local1"
-j LOG --log-level ${LOG_LEVEL} --log-prefix " Blah "

Then have local1 in /etc/syslog.conf go to /var/log/iptables.log

On Wed, 10 Sep 2003, akshaysalkar wrote:

>is there anyway i can completely avoid sending netfilter log messages to /var/log/messages
>
>i dont want to clutter up that file
>
>and instead put to /var/log/iptables.log
>
>it seems messages go in both files if i use 
>kern.info /var/log/iptables.log
>in the /etc/syslog.conf file
>
>
>i want just in one file ie. /var/log/iptables.log
>Get Your Private, Free E-mail from Indiatimes at http://email.indiatimes.com
>
> Buy The Best In BOOKS at http://www.bestsellers.indiatimes.com
>
>Bid for for Air Tickets on Air Sahara Flights at Prices Lower Than Before. Just log on to http://airsahara.indiatimes.com and Bid Now!
>
>

-- 
Stephen John Smoogen            smoogen@lanl.gov
Los Alamos National Labrador  CCN-5 Sched 5/40  PH: 5-8058
Ta-03 SM-261  MailStop P208 DP 17U  Los Alamos, NM 87545
-- So shines a good deed in a weary world. = Willy Wonka --


