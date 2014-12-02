From: =?utf-8?B?546L5Y+vIOeOiw==?= <klwangke@gmail.com>
Subject: Can not see VM packets using Netfilter
Date: Tue, 2 Dec 2014 00:48:59 -0500
Message-ID: <66549406-F09A-46F9-82B2-9BDF53A256E1@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:content-type:content-transfer-encoding:subject:message-id:date
         :to:mime-version;
        bh=E7RPsjzlgx9TNWsW5pGDYkuqmH3o2gNxZn4JdBONpFs=;
        b=JtFcyyZc/pHZr9b6HxoSdP7km29Ps/WIvgDx48ox8M91WBonbMmY269WbRK9z8obxC
         PQuf9p6NQKcmUPXhzi06mWm3tGQu/HrxRVWi2KoyEktBNI5gUwPz1n3Pcl+fkTPHV+8F
         WRz7pnboQj7ObciBoe7XrHjbIJEIdzcM+QmmDKTpwoTAx3ijV4jQOJGRC5lkjsPmoskk
         uYqmQ91NFYCudY/0P6LDOhRq9YaxaYsgvbhjYWOJqRNfZuOLsF0MAVtf3m5oN7eqPY8C
         6KOvvQ7utzOTbFJbCTTxV2D/bfQlGHVEXxyjImSqv0hgBLL/wsGXIRm5Aj4BC37PzTtI
         t1bA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org

Hi all,

I=92m recently developing a simple program using netfilter and I=92m ha=
ving a tricky problem. My program is mainly to log the src and dst ip a=
ddress of all the packets. This program is run in the host machine. I h=
ave several virtual machines on that host machine.=20

The problem is, I can not capture the packets generated or destined at =
the VMs. All the VMs use bridging network to connect.

Can anyone help me? A lot of thanks!

Best,

Ke