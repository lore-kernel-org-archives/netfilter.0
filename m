From: =?ISO-8859-2?Q?=A3ukasz_Hejnak?= <sziftgroup@wp.pl>
Subject: A crazy spam mailserver
Date: Tue, 07 Jun 2005 16:17:47 +0200
Message-ID: <42A5AC8B.5010401@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello everyone.
Today at around 12 AM local (10:00 GMT) I started recieving spam from a=20
particular host. Nothing strange about it, except the fact
that all of the mail is coming to my home mailserver that I got up just=20
a few days ago, and just for home usage/testing/learning.
And the bugger doesn't seem to give up, in the last four hours I got=20
around 50 SPAM messages - all the same.
The sender is NAVER-MAILER@naver.com and so far I just took steps to=20
block the spam - so the most straight forward thing that came to my mind=20
was to do a -DROP. The sender used a few different IP adresses, but most=20
of I was able to identify in the form of 1.2.3.0/24, so it all got up to=20
a list of five IP's, and so far I went with a script like this

BAD_IP_LIST=3D"1.2.3.0/24 4.5.6.0/24 7.8.9.0/24"
for IP in $BAD_IP_LIST
	{
	iptables -A INPUT -s $IP -DROP
	}

My question is: Is there a better way to act upon such a case?
because I'm not convinced to think that just doing a -DROP like the=20
above is the best idea.
For instance I may be blocking some other ip's, that could be innocent.
Or, not sure about this one though, is it possible I could be just=20
blocking some spoffed IP's?

With Regards
=A3ukasz Hejnak

"Greg: It's a little known fact, but e-mail servers were the tenth=20
plague that God visited upon the egyptians. All tat angel of death and=20
passover stuff is pure crap."

