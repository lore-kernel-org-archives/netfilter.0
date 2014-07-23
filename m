From: =?UTF-8?B?0JrQsNC30LjQvNC40YAg0JzQsNC70LXQstC40Yc=?= 
	<nvinside@gmail.com>
Subject: Do we need these iptables patches for our project?
Date: Wed, 23 Jul 2014 20:39:54 +0200
Message-ID: <CAPhnrU+KxNJugg+ss_5OoAf-QodAbbZ68zxw0k9ofOiDeuQvww@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=5THZP+VgFhBv58+LUeY4II85Ku5j1bfbncRyI1VBtjg=;
        b=FV1dIQFu2noTc3p4DihhQDxZxQs1qF8VwKMxI7Pjm/e1BIsN/RNI0BxBWLWmFndVC2
         96ad8OHUW5DWpqZrtxqLwyO1UqpM5gi2sJP422+TaTh6AlUailMshZh+VqMmOjMYkaEK
         pJ/WRXVloa+/z+ve1B5uZkcKdKjMtRz+RJw+yDgvP2zsM8e2/9+ZrrMDWj+PKGIejW0j
         ImOBhepCEJzbkcGWhrgdWtwNAeWq7pFMdcQBerDemwQ3ks9iSdgnTjtYW1GNeZP9TX6p
         JHxWLMyN1h5IjbfnhNLy8aTl8M5O75M868aJkoj+KRGN61D9az6Tgx1TPXYKxIQqIemq
         ZoMQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,
I'm one of the Android developer trying to build iptables for Android
for an external firewall project, we actually use some patches, and my
question is do we really need it, or is there a better way to handle
it? And if yes, why it's not already adopted in the branch? Or is it
better to implement nftables?

Project page and source
https://github.com/ukanth/afwall

9 patches can be found under:
\external\dist\iptables-patches

I not posted this in the developer mailing list because I'm unsure if
we need already need it or not and I'm not that expert to make a clear
statement about the necessary of these patches.

It would be fine to find some useful documentation about iptables on
Android, and what is necessary or important.

Thanks for helping me/us!
