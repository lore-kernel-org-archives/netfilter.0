From: Philip Prindeville <philipp_subx@redfish-solutions.com>
Subject: TCPMSS packet modification
Date: Thu, 8 Feb 2018 17:56:49 -0700
Message-ID: <6E19AB5D-8992-4E80-A57A-ECD4EAB3DE90@redfish-solutions.com>
Mime-Version: 1.0 (Mac OS X Mail 11.2 \(3445.5.20\))
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi all,

I’d like to use this extension but I have my doubts on just how often it’s useful.

It would be nice if there were a way to determine this concretely: perhaps it could be reimplemented as a matching filter, and only match on packets that had been changed.

I suspect that most hosts do the right thing, and that most networks correctly pass ICMP Unreachable - Fragmentation Needed, etc. but being able to log packets where this isn’t the case and clamping turns out to be necessary would be a lot more useful.

Anyone have any insight into this?

Thanks,

-Philip

