From: Brian <unixman83@gmail.com>
Subject: TPROXY getting the remote/destination address via sockets API
Date: Sat, 26 Nov 2011 20:28:04 -0600
Message-ID: <4ED1A034.9030802@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=Un1zPWIGew8mjAxCpY2hDs1IWI8nWiDldxLd1zqBUT0=;
        b=lC7Fj/jDRXD8/FtMqordshwf3lXHQxwN6uAW57WoGMDq+3khO//W6Z/ZW3j7UtUNXz
         MpqOyGu3iy93zlAnYwpJkfOOsVcbYG+bEZmSu2mT0NTjYBN7Wvupkpx8PlGfk6aaWjEz
         JvceAbzyyu9cep6YLRNY0k4ywZd2d1xiX/Qek=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Using the latest TPROXY, how does one accurately get the 
destination/remote (and the source/localish) addresses of the 
transparent proxy connection?

I would assume one address would be returned by the accept() call, which 
one, and how do I get the other?

Thanks,
Brian

