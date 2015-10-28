From: Shivani Bhardwaj <shivanib134@gmail.com>
Subject: Help needed with installation errors
Date: Wed, 28 Oct 2015 11:19:59 +0530
Message-ID: <CAKHNQQFNHhfU1VZTnP58R=j53q+hXhC0Bs894vgjnb3iy-AEmQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=sy+LO3oe7xXpg3CXOK8VohY5ufFNBDHpdqBV8UViAIg=;
        b=aThP69LcAZO8I3QsH8ERMaMMJyU4Y/oeh2jZeg+CivhGTKHozXrutQ7WMZWT/DeTP9
         c7rwOW8hXPML6+j+VHkaGZVHSo1VLkWZ6kHp+FuJDF9aXeRQono4h/zBo9D8e5A4iYTR
         1jcLxFJvjklijl7GX4TG/c/3BHZIk8ghGBllYF232yNkuyVwLGM0ZXlMzmE/to39jQSY
         PbemmZci6y19UDOHLktYTNSfpEU0wGMmKS6SNqhL+r4pCsdYuph52MUuu6Z0Wr4Xp4pO
         eQIU0OTgXRZT7sMCjLa167d3KMRtLl/oA6JvEpZWasSOpxEZJazdaB76H6JPesOt2KtD
         gZ/Q==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I'm trying to install libtool but for all its packages, it shows "NOT
FOUND". I tried the following:

sudo apt-get install libtool


I have also tried the following:

sudo apt-get update


and,


sudo apt-get --fix-missing install libtool


None of them works.
It always shows the following:


404  Not Found
Failed to fetch


while trying to fetch from the remote repository. Can somebody please
help me out? What am I doing wrong?

Thank you
Shivani
