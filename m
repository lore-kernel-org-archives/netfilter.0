From: =?UTF-8?B?56We5qW95Z2C546y5aWI?= <zh99998@gmail.com>
Subject: set route LSRR/SSRR option by iptables or nftables
Date: Fri, 13 May 2016 08:55:01 +0800
Message-ID: <CAP8bwDWMZ5fkxuX1T5rF-Xbe4Zn8gU0kUWqz93c=5otN2woXag@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to;
        bh=MoVGEHydftaGXekMDBcKJpbxgmAp8kALsS7+E25P+M4=;
        b=jr9eru8klMiWz/L2JN8GZdtit8IyWC1L28oh/MXXfzN6/z6ToFko2lz9AOYdg1iWxj
         EidzF8akXUA9ogixx3+Pko8Z9+K6rLJu4x66pRBXQuxNTbWP3wN36+FhrG6gL+YAfHQj
         h7CbT8vWYsAUbbZPzb57fsqg6gsk+UyMiZRIUYLP+KkrON+vV818ZJkWfnkpAZeoVXcL
         io7r6dbpZCMQ7JDVHzQk+BvcTnQAq6Utddqh8mT2j+A8fdvitwj/OpRmleZSpEFAqTFk
         LnEVpRxualtN+wJZOo+Y5sMkCrR1va8CThynehWWw7SHjEDdQ9yIjGhg/BiVfXupX585
         x70g==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

how could I set "strict source and record route" (SSRR) and "loose
source and record route" (LSRR) by iptables or nftables ?

if they can't do it, is there any other way to do it?
