From: "riffraff" <riffraff@mail.ev1.net>
Subject: Re: Logging - where does it go??
Date: Wed,  3 Jul 2002 13:30:12 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <200207031330.AA61145324@mail.ev1.net>
Reply-To: <riffraff@mail.ev1.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

---------- Original Message ----------------------------------
From: alexander.swann@synetics.fr
Date: Wed, 3 Jul 2002 20:24:03 +0200

>I tested to add these 2 ones (as suggested by GeorgeV)... but without any
>result ...
>
>*.*                                       /var/log/test
>*.=debug                                  /var/log/debugF
>
>(I restarted the syslogd also)
>
>So my stupid question is :
>What did I miss so that all logs goes in a file ? /var/log/messages or an
>other one ...
>
>Help ;-))
>
I believe syslog also requires the file to exist before it can log to it, so do a touch /var/log/test /var/log/debugF, then restart syslod.



