From: David Zage <djzage@gmail.com>
Subject: Concurrent netfilters
Date: Mon, 30 Jan 2012 16:46:20 -0700
Message-ID: <CAN9nwp7_EorcWaCuyHg64iuZf5_8EWYQ+kYFMkui3CK2k4rJRg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=CEsdV4o8X/RqEG3/rZ7y31DQtHNqG1963kWzeWIOk40=;
        b=QwdGD7elwOrR7werSPE0sJQ23QJ23GGAcmNdocVRvWUFG9lkjyHICaKd6W0eydtJ+t
         5choMJ2zd2GwPws3ldhBQDPEkkwCJvVxjIZWZD6Mp4xztTPZP8wfr4jNxsNqOvXJnc7H
         EAZdOg9J/9QxuLXVdKZg8QRoO6hG0QifoIt7Y=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Has there been work on netfilter to take advantage of multiple cores
(e.g., concurrent packet processing)?  I have looked at the code and
net for a bit and haven't really found anything related.  If there is
this type of functionality, please point me in the right direction.

Thanks in Advance
~ Dave
