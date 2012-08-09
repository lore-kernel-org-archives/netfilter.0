From: "Bryan K. Walton" <bkw@70mpg.org>
Subject: Filtering incoming 3G smartphone traffic using iptables?
Date: Thu, 9 Aug 2012 14:34:43 -0500
Message-ID: <CAM91gdBFqPw-Z5C9khGJ1JNjmQ2ZOtZh4XrEWK6yCmAiE2T2Jw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi guys,

On my home firewall, I'm been denying all incoming access to port 22.
Then, I've been allowing port 22 access from a specified mac address.
Now I would like to also allow access from a certain Android
smartphone.  The device has a mac address when it is using wi-fi.  But
from what I can see, when the data traffic is 3g traffic, there
doesn't seem to be a mac address.  Now, I've read that 3g traffic
doesn't use a mac address, and that is fine.

But how can I restrict port 22 access to this smart phone when using
3g service for its Internet?  Do I have any options?

Thanks,
Bryan
