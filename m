From: Valentin =?utf-8?B?VmlkacSH?= <vvidic@valentin-vidic.from.hr>
Subject: xt_cluster for IPv6
Date: Fri, 6 Dec 2019 21:48:00 +0100
Message-ID: <20191206204800.GD30087@valentin-vidic.from.hr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
        d=valentin-vidic.from.hr; s=2017; t=1575665281;
        bh=FaTwyrC8dFFtQtM9pj6vnTXbSd+oJ4oHsbAv40E5sEQ=;
        h=Date:From:To:Subject:From;
        b=FqMxRLO/jcTNxYnhQQGF/aw1wRe+GMR0HSY8GEXrORkPXOCr8rooovj7Akx3dQIos
         BrZfoCK3ao4xBUGQotbrGLn22Z0uY43Wc3hHOEa03n7YDsarX0zSD1oMQZ7Dev1IZ2
         vAu/VikBxzXcMswHztKFaqt7bhRYFWqhpkdyOOMBwuLqsjq53JWMNuy1WtRt8G7A8o
         I97h8g203Zh7R3AvHxtQ/M36RRyj+G9ScudDbkQkF1WUyutEDbhlW/JdxNTj9LChKb
         EGDzpPcx/pEm2TNANph2siH9gCq7HkbnJnWVyY1cRlxEr0O1zmDui0zULwGWdHLkbV
         tjKDkLFAnqFAg==
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I would like to try xt_cluster for IPv6 but not sure how
to do the equivalent of ARP rewrite:

  arptables -I OUTPUT -o eth1 --h-length 6 \
            -j mangle --mangle-mac-s 01:00:5e:00:01:01

Is it possible to rewrite Neighbor Advertisement packages
somehow?

-- 
Valentin
