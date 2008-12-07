From: Ivan Chernyavsky <camposer@yandex.ru>
Subject: ip/tcp checksumming
Date: Sun, 07 Dec 2008 17:20:47 +0300
Message-ID: <376611228659647@webmail82.yandex.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi all,

I'm using ip_queue target with packet modification in a userspace
program. So, I need to recompute packet checksums.

I found several references in netfilter-users mailing list telling
that some patch was expected to provide helper functions (including
checksumming). Unfortunately, I wasn't able to find that patch.

I understand that it's in fact very simple to write my own
checksumming routine, but if one should think about performance it
seems to be better to use "official" one =)

Could you please point me to some resource? Thanks in advance,

-- 
   Ivan

