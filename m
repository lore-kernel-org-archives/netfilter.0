From: Jochen Dehm <jochen.dehm@freenet.de>
Subject: ulogd2 - missing local.hostname
Date: Thu, 13 Apr 2017 19:24:47 +0200
Message-ID: <7ef141c1-9c30-6487-bd71-1c63e5f923cd@freenet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello everyone,

I'm using ulogd2 and the ability to write data into a mysql-db. In 
principle this works very well.

Because I have several firewalls, I would like to enter the hostname 
into the database. In the 1.x version was the plugin "ulogd_LOCAL.so" 
responsible.

According to the documentation https://rlworkman.net/howtos/ulogd.html 
it should still be there in the 2.x version, but I can not find it anymore.

I took ulogd2 from this source:
Https://github.com/bootc/ulogd2.git
and compiled.

Unfortunately, no file "ulogd_LOCAL.so" is generated.

If I look at the 1.x version here: https://github.com/kalloc/ulogd then 
I find in the folder extensions the "ulogd_LOCAL.c".

Is there a special reason why the file in 2.x no longer exists?
Is there another variant to save the hostname in the database?

Regards Joed

