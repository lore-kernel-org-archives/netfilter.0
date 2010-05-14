From: Markus Feldmann <feldmann_markus@gmx.de>
Subject: Re: iptables NEW or SYN
Date: Fri, 14 May 2010 02:23:52 +0200
Message-ID: <hsi56o$vb9$1@dough.gmane.org>
References: <hshbmv$547$1@dough.gmane.org>	 <alpine.LSU.2.01.1005131916320.9398@obet.zrqbmnf.qr>	 <hshf0k$ine$1@dough.gmane.org>	 <AANLkTimpGd4uEnY5UiFQDs1oE6uEji6lbLnUej7eCXoX@mail.gmail.com>	 <hshhcg$rl3$1@dough.gmane.org> <AANLkTilx7Gimy8RwVszEx1ijkR4mx2Q70HKJO72fAhTK@mail.gmail.com> <hsi46a$sro$1@dough.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <hsi46a$sro$1@dough.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I post my <iptables -L -n -v> so that you can see, all my chains contain 
a LOG followed by a DROP statement at the end. So i am sure that i know 
about all pakets which are dropped. Because of this, only in my 
attacksinput chain were packets dropped.

http://pastebin.com/Fb2uvBX4

regards Markus

