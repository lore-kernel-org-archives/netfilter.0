From: Ralf Hemmann <ralf@core-dump.de>
Subject: Update: Too scared.... Script
Date: Wed, 12 Jun 2002 04:15:10 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <aearcd$8pu$2@main.gmane.org>
References: <E17HVTU-00062d-00@pooh.kjernsmo.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <E17HVTU-00062d-00@pooh.kjernsmo.net>
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
To: netfilter@lists.samba.org


Hy a litttle update:

I forgot to mention the DEBUG parameter, otherwise the script would not
work unattended:
If your 100% shure your firewall rules are well done, change DEBUG to 0

!/bin/bash

DEBUG="1"  # 0 for normal use

[the scipt as posted]

if [ $DEBUG="1" ]; then

echo "Are you dead ?

answer with Ctrl C

[..as posted ]

fi


Ralf

