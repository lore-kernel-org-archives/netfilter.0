From: "Matthew Pepar" <thepigs@gmail.com>
Subject: voip question
Date: Sat, 25 Mar 2006 10:57:59 +1100
Message-ID: <fcfe0b070603241557n768205dkd919adc6a09e9b5b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

 I've been using netfilter successfully -- thanks for writing it.

I was wondering if I could improve my VOIP calls using netfilter.

 The main problem is excessive jitter delay to the receiver when P2P
or WEB uploads /browsing is/are occurring.

I have 512/128 ADSL and I am using tc-htb and using a reduced MTU (576
bytes). The RTP data is getting through its just that the jitter delay
is very long (seconds). The jitter delay returns to unnoticeable when
the uploads are stopped. Some basic testing indicates that jitter
delay is mostly unnoticeable if all other traffic is limited to
24kbit(!) upload.

I was wondering if netfilter could detect the outgoing/incoming RTP
traffic and then set a flag. After RTP traffic has finished the flag
would be removed (using a timeout). The flag could then be used to
CLASSIFY other packets into say a 24kbit upload pool.

 Looking at the iptables docs there is no specific module that could
do this although you could hack the 'condition' module to enable
setting of flags and add timeouts by reusing some of the 'recent'
module code. I am thinking about doing this, but I'd thought I'd ask
first to see if anyone has any thoughts about whether its been done
already or whether it would work or whether its too hard.

Thx,
Matt.

